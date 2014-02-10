//
// This unit is part of the GLScene Project, http://glscene.org
//
{: GLFileGL2<p>

	Vector file object loading of Ghoul2 model and animation 
	files into GLScene.<p>

	<b>History :</b><font size=-1><ul>
      <li>24/03/07 - DaStr - Added explicit pointer dereferencing
                             (thanks Burkhard Carstens) (Bugtracker ID = 1678644)
	   <li>22/10/03 - SG - Animation fixes, removed skeletal reconstruction
	   <li>25/03/03 - SG - Creation.
	</ul></font>
}
unit GLFileGL2;

interface

uses
  Classes, SysUtils, GLVectorFileObjects, ApplicationFileIO, GLMaterial, VectorGeometry,
  FileGL2, VectorTypes, VectorLists;

type

  TGLGLMVectorFile = class (TVectorFile)
    public
      class function Capabilities : TDataFileCapabilities; override;
      procedure LoadFromStream(aStream : TStream); override;
  end;

  TGLGLAVectorFile = class (TVectorFile)
    public
      class function Capabilities : TDataFileCapabilities; override;
      procedure LoadFromStream(aStream : TStream); override;
  end;

var
  vGhoul2LevelOfDetail     : Integer = 0; // Highest detail level by default
  vGhoul2MaxBonesPerVertex : Integer = 4; // Ghoul2 supports up to 4 bones
                                          // per vertex. Use this global
                                          // variable to set a different limit.

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

// ------------------
// ------------------ TGLGLMVectorFile ------------------
// ------------------

// Capabilities
//
class function TGLGLMVectorFile.Capabilities : TDataFileCapabilities;
begin
  Result:=[dfcRead];
end;

// LoadFromStream
//
procedure TGLGLMVectorFile.LoadFromStream(aStream : TStream);
var
  GLMFile     : TFileGLM;
  i,j,k,s,c,d : integer;
  mesh        : TSkeletonMeshObject;
  fg          : TFGVertexIndexList;
  VertOfs     : integer;
  shader      : string;
  vec2        : Tvector2f;
  numweights,
  boneref,
  boneid      : Integer;
  boneweight,
  weighttot   : Single;
  NumSurfVert : Integer;

  procedure AllocateMaterial(meshname,shader:string);
  var
    LibMat : TGLLibMaterial;
  begin
    if Assigned(Owner.MaterialLibrary) then with Owner.MaterialLibrary do begin
      if Assigned(Materials.GetLibMaterialByName(meshname)) then exit;
      LibMat:=Materials.Add;
      LibMat.name:=meshname;
      LibMat.Material.Texture.Disabled:=False;
    end;
  end;

begin
  GLMFile:=TFileGLM.Create;
  GLMFile.LoadFromStream(aStream);
  try
    // Need a way to import all levels of detail, but this global
    // variable will do for now.
    d:=vGhoul2LevelOfDetail;
    if d>=Length(GLMFile.LODs) then exit;
    for s:=0 to Length(GLMFile.SurfaceHeirachy)-1 do begin
      mesh:=TSkeletonMeshObject.CreateOwned(Owner.MeshObjects);
      mesh.Mode:=momFaceGroups;
      mesh.Name:=trim(GLMFile.SurfaceHeirachy[s].name);
      shader:=trim(GLMFile.SurfaceHeirachy[s].shader);
      AllocateMaterial(mesh.Name,shader);

      // Set size of VerticesBonesWeights
      NumSurfVert:=0;
      for c:=0 to GLMFile.SurfaceHeirachy[s].numChildren-1 do begin
        i:=GLMFile.SurfaceHeirachy[s].childIndices[c]-1;
        NumSurfVert:=NumSurfVert+GLMFile.LODs[d].Surfaces[i].SurfaceHeader.numVerts;
      end;
      mesh.BonesPerVertex:=vGhoul2MaxBonesPerVertex;
      mesh.VerticeBoneWeightCount:=NumSurfVert;
      for c:=0 to GLMFile.SurfaceHeirachy[s].numChildren-1 do begin
        i:=GLMFile.SurfaceHeirachy[s].childIndices[c]-1;
        with GLMFile.LODs[d].Surfaces[i] do begin
          VertOfs:=mesh.Vertices.Count;
          for j:=0 to Length(Vertices)-1 do begin
            // Add vertices and normals
            mesh.Vertices.Add(Vertices[j].vertex);
            mesh.Normals.Add(Vertices[j].normal);

            // Fix and then add the Texture coords
            vec2:=TexCoords[j];
            vec2.V[1]:=1-vec2.V[1]; // reverse the v coordinate
            mesh.TexCoords.Add(vec2);

            // Add weighted bones
            numweights:=G2_GetVertWeights(Vertices[j]);
            weighttot:=0;
            for k:=0 to mesh.BonesPerVertex-1 do
              if k<numweights then begin
                boneref:=G2_GetVertBoneIndex(Vertices[j],k);
                boneid:=BoneReferences[boneref];
                boneweight:=G2_GetVertBoneWeight(Vertices[j],k,weighttot,numweights);
                mesh.VerticesBonesWeights^[mesh.Vertices.Count-1]^[k].BoneID:=boneid;
                mesh.VerticesBonesWeights^[mesh.Vertices.Count-1]^[k].Weight:=boneweight;
              end else begin
                mesh.VerticesBonesWeights^[mesh.Vertices.Count-1]^[k].BoneID:=0;
                mesh.VerticesBonesWeights^[mesh.Vertices.Count-1]^[k].Weight:=0;
              end;
          end;
          fg:=TFGVertexIndexList.CreateOwned(mesh.FaceGroups);
          fg.Mode:=fgmmTriangles;
          fg.MaterialName:=mesh.Name;
          for j:=0 to Length(Triangles)-1 do begin
            // The faces need to be wound in the opposite direction so...
            fg.VertexIndices.Add(Triangles[j].indices[0]+VertOfs);
            fg.VertexIndices.Add(Triangles[j].indices[2]+VertOfs);
            fg.VertexIndices.Add(Triangles[j].indices[1]+VertOfs);
          end;
        end;
      end;
    end;

  finally
    GLMFile.Free;
  end;
end;


// ------------------
// ------------------ TGLGLAVectorFile ------------------
// ------------------

// Capabilities
//
class function TGLGLAVectorFile.Capabilities : TDataFileCapabilities;
begin
  Result:=[dfcRead];
end;

// LoadFromStream
//
procedure TGLGLAVectorFile.LoadFromStream(aStream : TStream);
var
  GLAFile  : TFileGLA;
  i,j      : Integer;
  frame    : TSkeletonFrame;
  CompBone : TGLACompQuatBone;
  quat     : TQuaternion;
  pos      : TAffineVector;
  basepose : TSkeletonFrame;
  bonelist : TIntegerList;
  bone     : TSkeletonBone;

begin
  GLAFile:=TFileGLA.Create;
  GLAFile.LoadFromStream(aStream);
  try
    if not (Owner is TGLActor) then exit;

    TGLActor(Owner).Reference:=aarSkeleton;

    bonelist:=TIntegerList.Create;
    for i:=0 to GLAFile.AnimHeader.numBones-1 do
      bonelist.Add(i);
    while bonelist.count>0 do begin
      if GLAFile.Skeleton[bonelist[0]].parent = -1 then
        bone:=TSkeletonBone.CreateOwned(Owner.Skeleton.RootBones)
      else begin
        bone:=Owner.Skeleton.RootBones.BoneByID(GLAFile.Skeleton[bonelist[0]].parent);
        if Assigned(bone) then
          bone:=TSkeletonBone.CreateOwned(bone)
      end;
      if Assigned(bone) then begin
        bone.Name:=GLAFile.Skeleton[bonelist[0]].Name;
        bone.BoneID:=bonelist[0];
      end else
        bonelist.Add(bonelist[0]);
      bonelist.Delete(0);
    end;
    bonelist.Free;

    // Build the base pose
    basepose:=TSkeletonFrame.CreateOwned(TGLActor(Owner).Skeleton.Frames);
    basepose.Name:='basepose';
    basepose.TransformMode:=sftQuaternion;
    basepose.Position.AddNulls(GLAFile.AnimHeader.numBones);
    basepose.Quaternion.AddNulls(GLAFile.AnimHeader.numBones);

    // Load animation data
    for i:=0 to GLAFile.AnimHeader.numFrames-1 do begin
      // Create the frame
      frame:=TSkeletonFrame.CreateOwned(TGLActor(Owner).Skeleton.Frames);
      frame.Name:='Frame'+IntToStr(i);
      frame.TransformMode:=sftQuaternion;

      for j:=0 to GLAFile.AnimHeader.numBones-1 do begin
        // Uncompress bone and add to the frame
        CompBone:=GLAFile.GetCompressedMatrix(i,j);
        quat:=QuaternionMake([CompBone[1]-32726,CompBone[2]-32726,CompBone[3]-32726],CompBone[0]-32726);
        pos:=AffineVectorMake(CompBone[4]/64-512,CompBone[5]/64-512,CompBone[6]/64-512);
        frame.Quaternion.Add(quat);
        frame.Position.Add(pos);
      end;
    end;

    Owner.Skeleton.RootBones.PrepareGlobalMatrices;

    for i:=0 to Owner.MeshObjects.Count-1 do
      TSkeletonMeshObject(Owner.MeshObjects[i]).PrepareBoneMatrixInvertedMeshes;

  finally
    GLAFile.Free;
  end;
end;


// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
initialization
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

   RegisterVectorFileFormat('glm', 'Ghoul2 (GLM) model files', TGLGLMVectorFile);
   RegisterVectorFileFormat('glx', 'Ghoul2 (GLX) model files', TGLGLMVectorFile);
   RegisterVectorFileFormat('gla', 'Ghoul2 (GLA) animation files', TGLGLAVectorFile);

end.

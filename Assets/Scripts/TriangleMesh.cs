using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
public class TriangleMesh : MonoBehaviour
{
    
    public Material material;

    private Mesh mesh;
    private MeshFilter meshFilter;
    private MeshRenderer meshRenderer;


    private void Start()
    {
        CreateMesh();
    }

    void CreateMesh()
    {
        mesh = new Mesh();
        mesh.name = "Triangle Mesh";

        meshFilter = GetComponent<MeshFilter>();
        meshRenderer = GetComponent<MeshRenderer>();

        //mesh.vertices = new Vector3[] {
        //    Vector3.zero, Vector3.right, -Vector3.up
        //};
        mesh.vertices = new Vector3[] {
          new Vector3(-0.5f, 0.5f, 0.0f),  //0
          new Vector3(0.5f, 0.5f, 0.0f),   //1
          new Vector3(0.0f, -0.5f, 0.0f)     //2

        };

        mesh.triangles = new int[] { 0, 1, 2 };
        meshFilter.mesh = mesh;

        meshRenderer.sharedMaterial = material;

    }

    
}

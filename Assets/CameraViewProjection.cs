using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraViewProjection : MonoBehaviour
{
    // Start is called before the first frame update

    private Camera _camera;
    public Matrix4x4 projection;
    public Matrix4x4 view;

    void Start()
    {
        _camera = GetComponent<Camera>();
    }

    // Update is called once per frame
    void Update()
    {
        UpdateProjectionMatrix();
        UpdateViewMatrix();
    }

    void UpdateProjectionMatrix()
    {
        projection = _camera.projectionMatrix;
      
    }
    void UpdateViewMatrix()
    {
        view = _camera.worldToCameraMatrix;
        //view = Matrix4x4.TRS(transform.position, transform.rotation, transform.localScale).inverse;

    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateArround : MonoBehaviour
{
    public float speed = 1.0f;
    public bool rotate = false;
    
    void Start()
    {
        transform.position = new Vector3 (0, 0, 5f);
        transform.LookAt(Vector3.zero);
    }

    // Update is called once per frame
    void LateUpdate()
    {
        if (rotate)
        {
            transform.RotateAround(Vector3.zero, Vector3.up, 20 * Time.deltaTime * speed);
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Textured : MonoBehaviour
{
    void Start()
    {
        // set material at runtime
        Material mat = Resources.Load("TestMat", typeof(Material)) as Material;
        GameObject smaple = GameObject.Find("Plane");
        smaple.GetComponent<MeshRenderer>().material = mat;
    }
}

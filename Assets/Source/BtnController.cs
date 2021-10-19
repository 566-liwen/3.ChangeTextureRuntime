using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BtnController : MonoBehaviour
{
    Material mat;
    GameObject smaple;
    public int index = 1;
    void Start() {

        mat = Resources.Load("TestMat", typeof(Material)) as Material;
        mat.SetInt("_Value", index);
        smaple = GameObject.Find("Plane");
        smaple.GetComponent<MeshRenderer>().material = mat;

        Button btn = transform.GetComponent<Button>();
        btn.onClick.AddListener(ButtonClicked);
    }

    void ButtonClicked()
    {
        index++;
        if (index>3) { 
            index = 1; 
        }
        smaple.GetComponent<MeshRenderer>().material.SetInt("_Value", index);
    }
}

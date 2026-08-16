using UnityEngine;

public class ScrollBackground : MonoBehaviour
{
    Material _mat;
    [SerializeField] float velocityX;
    Vector2 _offset;

    void Awake()
    {
        _mat = GetComponent<SpriteRenderer>().material;
    }

    void Update()
    {
        _offset.x += velocityX * Time.deltaTime;
        _mat.mainTextureOffset = _offset;
    }
}

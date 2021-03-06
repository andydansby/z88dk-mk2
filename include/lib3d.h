/*
lib3d.h

Structs for standard Wizard 3d and 4d math functions

Copyrightę 2002, Mark Hamilton

*/

#ifndef __LIB3D_H__
#define __LIB3D_H__

#include <sys/compiler.h>


// fixed point arithmetic

/// integer to fixed-point
extern long __LIB__ __FASTCALL__ i2f (int v);

/// fixed-point to integer
extern int __LIB__ f2i (long v);

/// fixed-point multiplication
#define mulfx(x,y)	f2i((long)y * (long)x)

/// fixed-point division
#define divfx(x,y)	(i2f(x)/(long)y)

/// fixed-point square
#define sqrfx(x)	(f2i((long)x * (long)x))

/// fixed-point square root
#define sqrtfx(x)	(((long)(sqrt(x)))*8)

/// weighted average (w=0.0 -> x, w=0.5->average, w=1.0 ->y)
//#define wgavgfx(x, y, w)	(mulfx(i2f(1) - w, x) + mulfx(w, y))


#define PI 3.14159265358979

/// represents a vector in 3 dimensions
typedef struct {
	int x, y, z;
} Vector_t;

#define vector_t Vector_t

/// a triangle made of 3 vertexes
typedef struct {
	vector_t* vertexes[3];	///< 3 vertexes
} triangle_t;

/// mesh: a set of points (vectors) refered by a set of triangles
typedef struct {
	int pcount;	///< number of points
	int tcount;	///< number of triangles

	vector_t* points;	///< points
	triangle_t* triangles;	///< triangles
} mesh_t;

/// an object is a solid in a scene, with translation, rotation and the solid's mesh
typedef struct {
	mesh_t* mesh;	///< mesh
	unsigned char rot_x;	///< angle of rotation X-axis
	unsigned char rot_y;	///< angle of rotation Y-axis
	unsigned char rot_z;	///< angle of rotation Z-axis
	int trans_x;	///< translation on X-axis
	int trans_y;	///< translation on Y-axis
	int trans_z;	///< translation on Z-axis
} object_t;

typedef struct {
	int x, y;
} Point_t;

typedef struct {
	int pitch, roll, yaw;
	int x, y, z;
} Cam_t;


/* protos */
extern __LIB__ ozrotatepointx(Vector_t *v, int rot);
extern __LIB__ ozrotatepointy(Vector_t *v, int rot);
extern __LIB__ ozrotatepointz(Vector_t *v, int rot);
extern __LIB__ ozplotpointcam(Vector_t *v, Cam_t *c, Point_t *p);
extern __LIB__ ozplotpoint(Vector_t *v, Point_t *p);
extern __LIB__ ozcopyvector(Vector_t *dest, Vector_t *src);
extern __LIB__ oztranslatevector(Vector_t *v, Vector_t *offset);


/* protos from MSX GFX lib */

/// pure length of vector v (it involves sqrt calculus, so it is expensive)
extern int __LIB__ vector_length(vector_t *v);

/// subtract vector v1 by v2, result in r
extern void __LIB__ vector_subtract (vector_t *v1, vector_t *v2, vector_t *r);

/// normalize vector p, result in r
extern void __LIB__ vector_normalize(vector_t *p, vector_t *r);

/// rotate vector p by the given angles, result in r
extern void __LIB__ vector_rotate(vector_t* p, int angle_x, int angle_y, int angle_z, vector_t* r);

/// dot product of v1 by v2
extern int __LIB__ vector_dot_product (vector_t* v1, vector_t* v2);

/// cross product of v1 by v2, result into r
extern void __LIB__ vector_cross_product (vector_t* v1, vector_t* v2, vector_t* r);

/// cross product of the z axis of v1 by v2
extern int __LIB__ vector_cross_product_z (vector_t* v1, vector_t* v2);

/// scale vector v by s, result in r
extern void __LIB__ vector_scalar(vector_t *v, int s, vector_t* r);

/// add vector v1 with v2, result in r
extern void __LIB__ vector_add(vector_t *v1, vector_t *v2, vector_t *r);

/// distance between vectors v1 and v2
extern int __LIB__ vector_distance (vector_t *v1, vector_t *v2);

/// create a new mesh with pcount points and tcount triangles
extern mesh_t __LIB__ *mesh_new(int pcount, int tcount);

/// deallocate mesh
extern void __LIB__ mesh_delete(mesh_t* mesh);

/// apply perspective transformations on object obj, centering the points around x and y
extern void __LIB__ object_apply_transformations(object_t* obj, vector_t* pbuffer, int x, int y);

/*
	Integer sin functions taken from the lib3d library, OZ7xx DK
	by Hamilton, Green and Pruss
	isin and icos return a value between -16384 and +16384
*/

extern int __LIB__ __FASTCALL__ isin(unsigned int degrees); /* input must be between 0 and 360 */
extern int __LIB__ __FASTCALL__ icos(unsigned int degrees); /* input must be between 0 and 360 */
extern int __LIB__  div256(long value); /* divide by 16384 */

#endif /* __LIB3D_H__ */

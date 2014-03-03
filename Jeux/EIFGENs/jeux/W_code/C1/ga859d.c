/*
 * Class GAME
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static EIF_TYPE_INDEX gen_type0_859 [] = {0,0xFF11,218,0xFFFF};
static EIF_TYPE_INDEX gen_type1_859 [] = {0,0xFF11,235,0xFF12,858,0xFFFF};
static EIF_TYPE_INDEX gen_type2_859 [] = {0,0xFF11,858,0xFFFF};
static EIF_TYPE_INDEX gen_type3_859 [] = {0,0,0xFFFF};
static EIF_TYPE_INDEX gen_type4_859 [] = {0,0,0xFFFF};
static EIF_TYPE_INDEX gen_type5_859 [] = {0,0xFF11,858,0xFFFF};
static EIF_TYPE_INDEX gen_type6_859 [] = {0,0xFF11,858,0xFFFF};
static EIF_TYPE_INDEX gen_type7_859 [] = {0,0,0xFFFF};
static EIF_TYPE_INDEX gen_type8_859 [] = {0,0xFF11,14,0xFFFF};
static EIF_TYPE_INDEX gen_type9_859 [] = {0,0xFF11,218,0xFFFF};
static EIF_TYPE_INDEX gen_type10_859 [] = {0,0xFF11,218,0xFFFF};
static EIF_TYPE_INDEX gen_type11_859 [] = {0,0xFF11,15,0xFFFF};
static EIF_TYPE_INDEX gen_type12_859 [] = {0,0xFF11,858,0xFFFF};


static struct desc_info desc_859[] = {
	{(BODY_INDEX) -1, (BODY_INDEX) -1, INVALID_DTYPE, NULL},
	{0, (BODY_INDEX)-1, 218, gen_type0_859},
	{1, (BODY_INDEX)-1, 235, gen_type1_859},
	{2, (BODY_INDEX)-1, 189, NULL},
	{3, (BODY_INDEX)-1, 189, NULL},
	{4, (BODY_INDEX)-1, 189, NULL},
	{5, (BODY_INDEX)-1, 189, NULL},
	{6, (BODY_INDEX)-1, 189, NULL},
	{7, (BODY_INDEX)-1, 189, NULL},
	{8, (BODY_INDEX)-1, 189, NULL},
	{9, (BODY_INDEX)-1, 189, NULL},
	{10, (BODY_INDEX)-1, 858, gen_type2_859},
	{11, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{12, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{13, (BODY_INDEX)-1, 0, gen_type3_859},
	{14, (BODY_INDEX)-1, 0, gen_type4_859},
	{15, (BODY_INDEX)-1, 858, gen_type5_859},
	{16, (BODY_INDEX)-1, 858, gen_type6_859},
	{17, (BODY_INDEX)-1, 0, gen_type7_859},
	{18, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{19, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{20, (BODY_INDEX)-1, 14, gen_type8_859},
	{21, (BODY_INDEX)-1, 218, gen_type9_859},
	{22, (BODY_INDEX)-1, 218, gen_type10_859},
	{23, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{24, (BODY_INDEX)-1, 15, gen_type11_859},
	{25, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{26, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{27, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{28, (BODY_INDEX)-1, 858, NULL},
	{29, (BODY_INDEX)-1, 213, NULL},
	{30, (BODY_INDEX)-1, 858, gen_type12_859},
	{12567, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
};

extern void Init859(void);
void Init859(void)
{
	IDSC(desc_859, 0, 858);
	IDSC(desc_859 + 1, 1, 858);
	IDSC(desc_859 + 32, 340, 858);
}


#ifdef __cplusplus
}
#endif

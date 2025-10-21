load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2e9n_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2E9N_ORTHOSTERIC_76A/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2E9N_ORTHOSTERIC_76A_model_0.pdb, pred_0
load my_predictions/2E9N_ORTHOSTERIC_76A/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2E9N_ORTHOSTERIC_76A_model_1.pdb, pred_1
load my_predictions/2E9N_ORTHOSTERIC_76A/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2E9N_ORTHOSTERIC_76A_model_2.pdb, pred_2
load my_predictions/2E9N_ORTHOSTERIC_76A/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2E9N_ORTHOSTERIC_76A_model_3.pdb, pred_3
load my_predictions/2E9N_ORTHOSTERIC_76A/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2E9N_ORTHOSTERIC_76A_model_4.pdb, pred_4
save ./tmp/2E9N_ORTHOSTERIC_76A_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3f9n_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3F9N_ALLOSTERIC_38M/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3F9N_ALLOSTERIC_38M_model_0.pdb, pred_0
load my_predictions/3F9N_ALLOSTERIC_38M/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3F9N_ALLOSTERIC_38M_model_1.pdb, pred_1
load my_predictions/3F9N_ALLOSTERIC_38M/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3F9N_ALLOSTERIC_38M_model_2.pdb, pred_2
load my_predictions/3F9N_ALLOSTERIC_38M/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3F9N_ALLOSTERIC_38M_model_3.pdb, pred_3
load my_predictions/3F9N_ALLOSTERIC_38M/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3F9N_ALLOSTERIC_38M_model_4.pdb, pred_4
save ./tmp/3F9N_ALLOSTERIC_38M_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/5mo4_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/5MO4_ORTHOSTERIC_NIL/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/5MO4_ORTHOSTERIC_NIL_model_0.pdb, pred_0
load my_predictions/5MO4_ORTHOSTERIC_NIL/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/5MO4_ORTHOSTERIC_NIL_model_1.pdb, pred_1
load my_predictions/5MO4_ORTHOSTERIC_NIL/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/5MO4_ORTHOSTERIC_NIL_model_2.pdb, pred_2
load my_predictions/5MO4_ORTHOSTERIC_NIL/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/5MO4_ORTHOSTERIC_NIL_model_3.pdb, pred_3
load my_predictions/5MO4_ORTHOSTERIC_NIL/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/5MO4_ORTHOSTERIC_NIL_model_4.pdb, pred_4
save ./tmp/5MO4_ORTHOSTERIC_NIL_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3pyy_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3PYY_ALLOSTERIC_3YY/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3PYY_ALLOSTERIC_3YY_model_0.pdb, pred_0
load my_predictions/3PYY_ALLOSTERIC_3YY/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3PYY_ALLOSTERIC_3YY_model_1.pdb, pred_1
load my_predictions/3PYY_ALLOSTERIC_3YY/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3PYY_ALLOSTERIC_3YY_model_2.pdb, pred_2
load my_predictions/3PYY_ALLOSTERIC_3YY/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3PYY_ALLOSTERIC_3YY_model_3.pdb, pred_3
load my_predictions/3PYY_ALLOSTERIC_3YY/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3PYY_ALLOSTERIC_3YY_model_4.pdb, pred_4
save ./tmp/3PYY_ALLOSTERIC_3YY_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/5mo4_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/5MO4_ALLOSTERIC_AY7/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/5MO4_ALLOSTERIC_AY7_model_0.pdb, pred_0
load my_predictions/5MO4_ALLOSTERIC_AY7/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/5MO4_ALLOSTERIC_AY7_model_1.pdb, pred_1
load my_predictions/5MO4_ALLOSTERIC_AY7/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/5MO4_ALLOSTERIC_AY7_model_2.pdb, pred_2
load my_predictions/5MO4_ALLOSTERIC_AY7/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/5MO4_ALLOSTERIC_AY7_model_3.pdb, pred_3
load my_predictions/5MO4_ALLOSTERIC_AY7/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/5MO4_ALLOSTERIC_AY7_model_4.pdb, pred_4
save ./tmp/5MO4_ALLOSTERIC_AY7_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3k5v_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3K5V_ORTHOSTERIC_STI/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3K5V_ORTHOSTERIC_STI_model_0.pdb, pred_0
load my_predictions/3K5V_ORTHOSTERIC_STI/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3K5V_ORTHOSTERIC_STI_model_1.pdb, pred_1
load my_predictions/3K5V_ORTHOSTERIC_STI/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3K5V_ORTHOSTERIC_STI_model_2.pdb, pred_2
load my_predictions/3K5V_ORTHOSTERIC_STI/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3K5V_ORTHOSTERIC_STI_model_3.pdb, pred_3
load my_predictions/3K5V_ORTHOSTERIC_STI/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3K5V_ORTHOSTERIC_STI_model_4.pdb, pred_4
save ./tmp/3K5V_ORTHOSTERIC_STI_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3k5v_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3K5V_ALLOSTERIC_STJ/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3K5V_ALLOSTERIC_STJ_model_0.pdb, pred_0
load my_predictions/3K5V_ALLOSTERIC_STJ/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3K5V_ALLOSTERIC_STJ_model_1.pdb, pred_1
load my_predictions/3K5V_ALLOSTERIC_STJ/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3K5V_ALLOSTERIC_STJ_model_2.pdb, pred_2
load my_predictions/3K5V_ALLOSTERIC_STJ/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3K5V_ALLOSTERIC_STJ_model_3.pdb, pred_3
load my_predictions/3K5V_ALLOSTERIC_STJ/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3K5V_ALLOSTERIC_STJ_model_4.pdb, pred_4
save ./tmp/3K5V_ALLOSTERIC_STJ_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1jqh_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1JQH_ORTHOSTERIC_ANP/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1JQH_ORTHOSTERIC_ANP_model_0.pdb, pred_0
load my_predictions/1JQH_ORTHOSTERIC_ANP/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1JQH_ORTHOSTERIC_ANP_model_1.pdb, pred_1
load my_predictions/1JQH_ORTHOSTERIC_ANP/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1JQH_ORTHOSTERIC_ANP_model_2.pdb, pred_2
load my_predictions/1JQH_ORTHOSTERIC_ANP/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1JQH_ORTHOSTERIC_ANP_model_3.pdb, pred_3
load my_predictions/1JQH_ORTHOSTERIC_ANP/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1JQH_ORTHOSTERIC_ANP_model_4.pdb, pred_4
save ./tmp/1JQH_ORTHOSTERIC_ANP_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3i81_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3I81_ORTHOSTERIC_EBI/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3I81_ORTHOSTERIC_EBI_model_0.pdb, pred_0
load my_predictions/3I81_ORTHOSTERIC_EBI/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3I81_ORTHOSTERIC_EBI_model_1.pdb, pred_1
load my_predictions/3I81_ORTHOSTERIC_EBI/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3I81_ORTHOSTERIC_EBI_model_2.pdb, pred_2
load my_predictions/3I81_ORTHOSTERIC_EBI/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3I81_ORTHOSTERIC_EBI_model_3.pdb, pred_3
load my_predictions/3I81_ORTHOSTERIC_EBI/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3I81_ORTHOSTERIC_EBI_model_4.pdb, pred_4
save ./tmp/3I81_ORTHOSTERIC_EBI_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3lw0_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3LW0_ALLOSTERIC_CCX/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3LW0_ALLOSTERIC_CCX_model_0.pdb, pred_0
load my_predictions/3LW0_ALLOSTERIC_CCX/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3LW0_ALLOSTERIC_CCX_model_1.pdb, pred_1
load my_predictions/3LW0_ALLOSTERIC_CCX/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3LW0_ALLOSTERIC_CCX_model_2.pdb, pred_2
load my_predictions/3LW0_ALLOSTERIC_CCX/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3LW0_ALLOSTERIC_CCX_model_3.pdb, pred_3
load my_predictions/3LW0_ALLOSTERIC_CCX/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3LW0_ALLOSTERIC_CCX_model_4.pdb, pred_4
save ./tmp/3LW0_ALLOSTERIC_CCX_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3nxu_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3NXU_ORTHOSTERIC_RIT/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3NXU_ORTHOSTERIC_RIT_model_0.pdb, pred_0
load my_predictions/3NXU_ORTHOSTERIC_RIT/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3NXU_ORTHOSTERIC_RIT_model_1.pdb, pred_1
load my_predictions/3NXU_ORTHOSTERIC_RIT/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3NXU_ORTHOSTERIC_RIT_model_2.pdb, pred_2
load my_predictions/3NXU_ORTHOSTERIC_RIT/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3NXU_ORTHOSTERIC_RIT_model_3.pdb, pred_3
load my_predictions/3NXU_ORTHOSTERIC_RIT/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3NXU_ORTHOSTERIC_RIT_model_4.pdb, pred_4
save ./tmp/3NXU_ORTHOSTERIC_RIT_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/5a1r_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/5A1R_ALLOSTERIC_STR/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/5A1R_ALLOSTERIC_STR_model_0.pdb, pred_0
load my_predictions/5A1R_ALLOSTERIC_STR/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/5A1R_ALLOSTERIC_STR_model_1.pdb, pred_1
load my_predictions/5A1R_ALLOSTERIC_STR/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/5A1R_ALLOSTERIC_STR_model_2.pdb, pred_2
load my_predictions/5A1R_ALLOSTERIC_STR/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/5A1R_ALLOSTERIC_STR_model_3.pdb, pred_3
load my_predictions/5A1R_ALLOSTERIC_STR/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/5A1R_ALLOSTERIC_STR_model_4.pdb, pred_4
save ./tmp/5A1R_ALLOSTERIC_STR_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1mmn_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1MMN_ORTHOSTERIC_ANP/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1MMN_ORTHOSTERIC_ANP_model_0.pdb, pred_0
load my_predictions/1MMN_ORTHOSTERIC_ANP/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1MMN_ORTHOSTERIC_ANP_model_1.pdb, pred_1
load my_predictions/1MMN_ORTHOSTERIC_ANP/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1MMN_ORTHOSTERIC_ANP_model_2.pdb, pred_2
load my_predictions/1MMN_ORTHOSTERIC_ANP/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1MMN_ORTHOSTERIC_ANP_model_3.pdb, pred_3
load my_predictions/1MMN_ORTHOSTERIC_ANP/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1MMN_ORTHOSTERIC_ANP_model_4.pdb, pred_4
save ./tmp/1MMN_ORTHOSTERIC_ANP_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1yv3_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1YV3_ALLOSTERIC_BIT/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1YV3_ALLOSTERIC_BIT_model_0.pdb, pred_0
load my_predictions/1YV3_ALLOSTERIC_BIT/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1YV3_ALLOSTERIC_BIT_model_1.pdb, pred_1
load my_predictions/1YV3_ALLOSTERIC_BIT/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1YV3_ALLOSTERIC_BIT_model_2.pdb, pred_2
load my_predictions/1YV3_ALLOSTERIC_BIT/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1YV3_ALLOSTERIC_BIT_model_3.pdb, pred_3
load my_predictions/1YV3_ALLOSTERIC_BIT/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1YV3_ALLOSTERIC_BIT_model_4.pdb, pred_4
save ./tmp/1YV3_ALLOSTERIC_BIT_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2ax9_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2AX9_ORTHOSTERIC_BHM/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2AX9_ORTHOSTERIC_BHM_model_0.pdb, pred_0
load my_predictions/2AX9_ORTHOSTERIC_BHM/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2AX9_ORTHOSTERIC_BHM_model_1.pdb, pred_1
load my_predictions/2AX9_ORTHOSTERIC_BHM/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2AX9_ORTHOSTERIC_BHM_model_2.pdb, pred_2
load my_predictions/2AX9_ORTHOSTERIC_BHM/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2AX9_ORTHOSTERIC_BHM_model_3.pdb, pred_3
load my_predictions/2AX9_ORTHOSTERIC_BHM/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2AX9_ORTHOSTERIC_BHM_model_4.pdb, pred_4
save ./tmp/2AX9_ORTHOSTERIC_BHM_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2pio_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2PIO_ORTHOSTERIC_DHT/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2PIO_ORTHOSTERIC_DHT_model_0.pdb, pred_0
load my_predictions/2PIO_ORTHOSTERIC_DHT/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2PIO_ORTHOSTERIC_DHT_model_1.pdb, pred_1
load my_predictions/2PIO_ORTHOSTERIC_DHT/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2PIO_ORTHOSTERIC_DHT_model_2.pdb, pred_2
load my_predictions/2PIO_ORTHOSTERIC_DHT/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2PIO_ORTHOSTERIC_DHT_model_3.pdb, pred_3
load my_predictions/2PIO_ORTHOSTERIC_DHT/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2PIO_ORTHOSTERIC_DHT_model_4.pdb, pred_4
save ./tmp/2PIO_ORTHOSTERIC_DHT_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2yhd_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2YHD_ALLOSTERIC_AV6/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2YHD_ALLOSTERIC_AV6_model_0.pdb, pred_0
load my_predictions/2YHD_ALLOSTERIC_AV6/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2YHD_ALLOSTERIC_AV6_model_1.pdb, pred_1
load my_predictions/2YHD_ALLOSTERIC_AV6/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2YHD_ALLOSTERIC_AV6_model_2.pdb, pred_2
load my_predictions/2YHD_ALLOSTERIC_AV6/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2YHD_ALLOSTERIC_AV6_model_3.pdb, pred_3
load my_predictions/2YHD_ALLOSTERIC_AV6/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2YHD_ALLOSTERIC_AV6_model_4.pdb, pred_4
save ./tmp/2YHD_ALLOSTERIC_AV6_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2ylo_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2YLO_ALLOSTERIC_YLO/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2YLO_ALLOSTERIC_YLO_model_0.pdb, pred_0
load my_predictions/2YLO_ALLOSTERIC_YLO/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2YLO_ALLOSTERIC_YLO_model_1.pdb, pred_1
load my_predictions/2YLO_ALLOSTERIC_YLO/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2YLO_ALLOSTERIC_YLO_model_2.pdb, pred_2
load my_predictions/2YLO_ALLOSTERIC_YLO/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2YLO_ALLOSTERIC_YLO_model_3.pdb, pred_3
load my_predictions/2YLO_ALLOSTERIC_YLO/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2YLO_ALLOSTERIC_YLO_model_4.pdb, pred_4
save ./tmp/2YLO_ALLOSTERIC_YLO_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1bzc_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1BZC_ORTHOSTERIC_TPI/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1BZC_ORTHOSTERIC_TPI_model_0.pdb, pred_0
load my_predictions/1BZC_ORTHOSTERIC_TPI/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1BZC_ORTHOSTERIC_TPI_model_1.pdb, pred_1
load my_predictions/1BZC_ORTHOSTERIC_TPI/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1BZC_ORTHOSTERIC_TPI_model_2.pdb, pred_2
load my_predictions/1BZC_ORTHOSTERIC_TPI/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1BZC_ORTHOSTERIC_TPI_model_3.pdb, pred_3
load my_predictions/1BZC_ORTHOSTERIC_TPI/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1BZC_ORTHOSTERIC_TPI_model_4.pdb, pred_4
save ./tmp/1BZC_ORTHOSTERIC_TPI_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1t49_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1T49_ALLOSTERIC_892/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1T49_ALLOSTERIC_892_model_0.pdb, pred_0
load my_predictions/1T49_ALLOSTERIC_892/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1T49_ALLOSTERIC_892_model_1.pdb, pred_1
load my_predictions/1T49_ALLOSTERIC_892/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1T49_ALLOSTERIC_892_model_2.pdb, pred_2
load my_predictions/1T49_ALLOSTERIC_892/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1T49_ALLOSTERIC_892_model_3.pdb, pred_3
load my_predictions/1T49_ALLOSTERIC_892/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1T49_ALLOSTERIC_892_model_4.pdb, pred_4
save ./tmp/1T49_ALLOSTERIC_892_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3mvh_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3MVH_ORTHOSTERIC_WFE/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3MVH_ORTHOSTERIC_WFE_model_0.pdb, pred_0
load my_predictions/3MVH_ORTHOSTERIC_WFE/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3MVH_ORTHOSTERIC_WFE_model_1.pdb, pred_1
load my_predictions/3MVH_ORTHOSTERIC_WFE/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3MVH_ORTHOSTERIC_WFE_model_2.pdb, pred_2
load my_predictions/3MVH_ORTHOSTERIC_WFE/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3MVH_ORTHOSTERIC_WFE_model_3.pdb, pred_3
load my_predictions/3MVH_ORTHOSTERIC_WFE/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3MVH_ORTHOSTERIC_WFE_model_4.pdb, pred_4
save ./tmp/3MVH_ORTHOSTERIC_WFE_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/4ejn_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/4EJN_ALLOSTERIC_0R4/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/4EJN_ALLOSTERIC_0R4_model_0.pdb, pred_0
load my_predictions/4EJN_ALLOSTERIC_0R4/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/4EJN_ALLOSTERIC_0R4_model_1.pdb, pred_1
load my_predictions/4EJN_ALLOSTERIC_0R4/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/4EJN_ALLOSTERIC_0R4_model_2.pdb, pred_2
load my_predictions/4EJN_ALLOSTERIC_0R4/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/4EJN_ALLOSTERIC_0R4_model_3.pdb, pred_3
load my_predictions/4EJN_ALLOSTERIC_0R4/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/4EJN_ALLOSTERIC_0R4_model_4.pdb, pred_4
save ./tmp/4EJN_ALLOSTERIC_0R4_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3fgu_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3FGU_ORTHOSTERIC_ANP/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3FGU_ORTHOSTERIC_ANP_model_0.pdb, pred_0
load my_predictions/3FGU_ORTHOSTERIC_ANP/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3FGU_ORTHOSTERIC_ANP_model_1.pdb, pred_1
load my_predictions/3FGU_ORTHOSTERIC_ANP/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3FGU_ORTHOSTERIC_ANP_model_2.pdb, pred_2
load my_predictions/3FGU_ORTHOSTERIC_ANP/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3FGU_ORTHOSTERIC_ANP_model_3.pdb, pred_3
load my_predictions/3FGU_ORTHOSTERIC_ANP/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3FGU_ORTHOSTERIC_ANP_model_4.pdb, pred_4
save ./tmp/3FGU_ORTHOSTERIC_ANP_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1v4s_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1V4S_ALLOSTERIC_MRK/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1V4S_ALLOSTERIC_MRK_model_0.pdb, pred_0
load my_predictions/1V4S_ALLOSTERIC_MRK/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1V4S_ALLOSTERIC_MRK_model_1.pdb, pred_1
load my_predictions/1V4S_ALLOSTERIC_MRK/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1V4S_ALLOSTERIC_MRK_model_2.pdb, pred_2
load my_predictions/1V4S_ALLOSTERIC_MRK/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1V4S_ALLOSTERIC_MRK_model_3.pdb, pred_3
load my_predictions/1V4S_ALLOSTERIC_MRK/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1V4S_ALLOSTERIC_MRK_model_4.pdb, pred_4
save ./tmp/1V4S_ALLOSTERIC_MRK_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/4izy_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/4IZY_ORTHOSTERIC_1J2/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/4IZY_ORTHOSTERIC_1J2_model_0.pdb, pred_0
load my_predictions/4IZY_ORTHOSTERIC_1J2/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/4IZY_ORTHOSTERIC_1J2_model_1.pdb, pred_1
load my_predictions/4IZY_ORTHOSTERIC_1J2/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/4IZY_ORTHOSTERIC_1J2_model_2.pdb, pred_2
load my_predictions/4IZY_ORTHOSTERIC_1J2/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/4IZY_ORTHOSTERIC_1J2_model_3.pdb, pred_3
load my_predictions/4IZY_ORTHOSTERIC_1J2/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/4IZY_ORTHOSTERIC_1J2_model_4.pdb, pred_4
save ./tmp/4IZY_ORTHOSTERIC_1J2_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3o2m_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3O2M_ALLOSTERIC_46A/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3O2M_ALLOSTERIC_46A_model_0.pdb, pred_0
load my_predictions/3O2M_ALLOSTERIC_46A/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3O2M_ALLOSTERIC_46A_model_1.pdb, pred_1
load my_predictions/3O2M_ALLOSTERIC_46A/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3O2M_ALLOSTERIC_46A_model_2.pdb, pred_2
load my_predictions/3O2M_ALLOSTERIC_46A/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3O2M_ALLOSTERIC_46A_model_3.pdb, pred_3
load my_predictions/3O2M_ALLOSTERIC_46A/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3O2M_ALLOSTERIC_46A_model_4.pdb, pred_4
save ./tmp/3O2M_ALLOSTERIC_46A_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/5aph_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/5APH_ORTHOSTERIC_VYI/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/5APH_ORTHOSTERIC_VYI_model_0.pdb, pred_0
load my_predictions/5APH_ORTHOSTERIC_VYI/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/5APH_ORTHOSTERIC_VYI_model_1.pdb, pred_1
load my_predictions/5APH_ORTHOSTERIC_VYI/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/5APH_ORTHOSTERIC_VYI_model_2.pdb, pred_2
load my_predictions/5APH_ORTHOSTERIC_VYI/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/5APH_ORTHOSTERIC_VYI_model_3.pdb, pred_3
load my_predictions/5APH_ORTHOSTERIC_VYI/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/5APH_ORTHOSTERIC_VYI_model_4.pdb, pred_4
save ./tmp/5APH_ORTHOSTERIC_VYI_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/4ypq_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/4YPQ_ALLOSTERIC_4F1/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/4YPQ_ALLOSTERIC_4F1_model_0.pdb, pred_0
load my_predictions/4YPQ_ALLOSTERIC_4F1/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/4YPQ_ALLOSTERIC_4F1_model_1.pdb, pred_1
load my_predictions/4YPQ_ALLOSTERIC_4F1/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/4YPQ_ALLOSTERIC_4F1_model_2.pdb, pred_2
load my_predictions/4YPQ_ALLOSTERIC_4F1/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/4YPQ_ALLOSTERIC_4F1_model_3.pdb, pred_3
load my_predictions/4YPQ_ALLOSTERIC_4F1/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/4YPQ_ALLOSTERIC_4F1_model_4.pdb, pred_4
save ./tmp/4YPQ_ALLOSTERIC_4F1_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3zcw_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3ZCW_ORTHOSTERIC_ADP/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3ZCW_ORTHOSTERIC_ADP_model_0.pdb, pred_0
load my_predictions/3ZCW_ORTHOSTERIC_ADP/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3ZCW_ORTHOSTERIC_ADP_model_1.pdb, pred_1
load my_predictions/3ZCW_ORTHOSTERIC_ADP/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3ZCW_ORTHOSTERIC_ADP_model_2.pdb, pred_2
load my_predictions/3ZCW_ORTHOSTERIC_ADP/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3ZCW_ORTHOSTERIC_ADP_model_3.pdb, pred_3
load my_predictions/3ZCW_ORTHOSTERIC_ADP/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3ZCW_ORTHOSTERIC_ADP_model_4.pdb, pred_4
save ./tmp/3ZCW_ORTHOSTERIC_ADP_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2gm1_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2GM1_ALLOSTERIC_2AZ/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2GM1_ALLOSTERIC_2AZ_model_0.pdb, pred_0
load my_predictions/2GM1_ALLOSTERIC_2AZ/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2GM1_ALLOSTERIC_2AZ_model_1.pdb, pred_1
load my_predictions/2GM1_ALLOSTERIC_2AZ/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2GM1_ALLOSTERIC_2AZ_model_2.pdb, pred_2
load my_predictions/2GM1_ALLOSTERIC_2AZ/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2GM1_ALLOSTERIC_2AZ_model_3.pdb, pred_3
load my_predictions/2GM1_ALLOSTERIC_2AZ/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2GM1_ALLOSTERIC_2AZ_model_4.pdb, pred_4
save ./tmp/2GM1_ALLOSTERIC_2AZ_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3wpn_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3WPN_ALLOSTERIC_B4S/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3WPN_ALLOSTERIC_B4S_model_0.pdb, pred_0
load my_predictions/3WPN_ALLOSTERIC_B4S/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3WPN_ALLOSTERIC_B4S_model_1.pdb, pred_1
load my_predictions/3WPN_ALLOSTERIC_B4S/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3WPN_ALLOSTERIC_B4S_model_2.pdb, pred_2
load my_predictions/3WPN_ALLOSTERIC_B4S/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3WPN_ALLOSTERIC_B4S_model_3.pdb, pred_3
load my_predictions/3WPN_ALLOSTERIC_B4S/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3WPN_ALLOSTERIC_B4S_model_4.pdb, pred_4
save ./tmp/3WPN_ALLOSTERIC_B4S_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1axb_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1AXB_ORTHOSTERIC_FOS/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1AXB_ORTHOSTERIC_FOS_model_0.pdb, pred_0
load my_predictions/1AXB_ORTHOSTERIC_FOS/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1AXB_ORTHOSTERIC_FOS_model_1.pdb, pred_1
load my_predictions/1AXB_ORTHOSTERIC_FOS/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1AXB_ORTHOSTERIC_FOS_model_2.pdb, pred_2
load my_predictions/1AXB_ORTHOSTERIC_FOS/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1AXB_ORTHOSTERIC_FOS_model_3.pdb, pred_3
load my_predictions/1AXB_ORTHOSTERIC_FOS/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1AXB_ORTHOSTERIC_FOS_model_4.pdb, pred_4
save ./tmp/1AXB_ORTHOSTERIC_FOS_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/1pzp_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/1PZP_ALLOSTERIC_FTA/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/1PZP_ALLOSTERIC_FTA_model_0.pdb, pred_0
load my_predictions/1PZP_ALLOSTERIC_FTA/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/1PZP_ALLOSTERIC_FTA_model_1.pdb, pred_1
load my_predictions/1PZP_ALLOSTERIC_FTA/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/1PZP_ALLOSTERIC_FTA_model_2.pdb, pred_2
load my_predictions/1PZP_ALLOSTERIC_FTA/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/1PZP_ALLOSTERIC_FTA_model_3.pdb, pred_3
load my_predictions/1PZP_ALLOSTERIC_FTA/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/1PZP_ALLOSTERIC_FTA_model_4.pdb, pred_4
save ./tmp/1PZP_ALLOSTERIC_FTA_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3pe2_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3PE2_ORTHOSTERIC_E1B/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3PE2_ORTHOSTERIC_E1B_model_0.pdb, pred_0
load my_predictions/3PE2_ORTHOSTERIC_E1B/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3PE2_ORTHOSTERIC_E1B_model_1.pdb, pred_1
load my_predictions/3PE2_ORTHOSTERIC_E1B/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3PE2_ORTHOSTERIC_E1B_model_2.pdb, pred_2
load my_predictions/3PE2_ORTHOSTERIC_E1B/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3PE2_ORTHOSTERIC_E1B_model_3.pdb, pred_3
load my_predictions/3PE2_ORTHOSTERIC_E1B/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3PE2_ORTHOSTERIC_E1B_model_4.pdb, pred_4
save ./tmp/3PE2_ORTHOSTERIC_E1B_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/6fvf_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/6FVF_ALLOSTERIC_503/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/6FVF_ALLOSTERIC_503_model_0.pdb, pred_0
load my_predictions/6FVF_ALLOSTERIC_503/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/6FVF_ALLOSTERIC_503_model_1.pdb, pred_1
load my_predictions/6FVF_ALLOSTERIC_503/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/6FVF_ALLOSTERIC_503_model_2.pdb, pred_2
load my_predictions/6FVF_ALLOSTERIC_503/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/6FVF_ALLOSTERIC_503_model_3.pdb, pred_3
load my_predictions/6FVF_ALLOSTERIC_503/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/6FVF_ALLOSTERIC_503_model_4.pdb, pred_4
save ./tmp/6FVF_ALLOSTERIC_503_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/2ijm_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/2IJM_ORTHOSTERIC_ATP/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/2IJM_ORTHOSTERIC_ATP_model_0.pdb, pred_0
load my_predictions/2IJM_ORTHOSTERIC_ATP/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/2IJM_ORTHOSTERIC_ATP_model_1.pdb, pred_1
load my_predictions/2IJM_ORTHOSTERIC_ATP/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/2IJM_ORTHOSTERIC_ATP_model_2.pdb, pred_2
load my_predictions/2IJM_ORTHOSTERIC_ATP/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/2IJM_ORTHOSTERIC_ATP_model_3.pdb, pred_3
load my_predictions/2IJM_ORTHOSTERIC_ATP/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/2IJM_ORTHOSTERIC_ATP_model_4.pdb, pred_4
save ./tmp/2IJM_ORTHOSTERIC_ATP_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3bz3_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3BZ3_ORTHOSTERIC_YAM/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3BZ3_ORTHOSTERIC_YAM_model_0.pdb, pred_0
load my_predictions/3BZ3_ORTHOSTERIC_YAM/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3BZ3_ORTHOSTERIC_YAM_model_1.pdb, pred_1
load my_predictions/3BZ3_ORTHOSTERIC_YAM/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3BZ3_ORTHOSTERIC_YAM_model_2.pdb, pred_2
load my_predictions/3BZ3_ORTHOSTERIC_YAM/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3BZ3_ORTHOSTERIC_YAM_model_3.pdb, pred_3
load my_predictions/3BZ3_ORTHOSTERIC_YAM/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3BZ3_ORTHOSTERIC_YAM_model_4.pdb, pred_4
save ./tmp/3BZ3_ORTHOSTERIC_YAM_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/4ebv_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/4EBV_ALLOSTERIC_0O7/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/4EBV_ALLOSTERIC_0O7_model_0.pdb, pred_0
load my_predictions/4EBV_ALLOSTERIC_0O7/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/4EBV_ALLOSTERIC_0O7_model_1.pdb, pred_1
load my_predictions/4EBV_ALLOSTERIC_0O7/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/4EBV_ALLOSTERIC_0O7_model_2.pdb, pred_2
load my_predictions/4EBV_ALLOSTERIC_0O7/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/4EBV_ALLOSTERIC_0O7_model_3.pdb, pred_3
load my_predictions/4EBV_ALLOSTERIC_0O7/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/4EBV_ALLOSTERIC_0O7_model_4.pdb, pred_4
save ./tmp/4EBV_ALLOSTERIC_0O7_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3kf7_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3KF7_ORTHOSTERIC_L9G/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3KF7_ORTHOSTERIC_L9G_model_0.pdb, pred_0
load my_predictions/3KF7_ORTHOSTERIC_L9G/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3KF7_ORTHOSTERIC_L9G_model_1.pdb, pred_1
load my_predictions/3KF7_ORTHOSTERIC_L9G/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3KF7_ORTHOSTERIC_L9G_model_2.pdb, pred_2
load my_predictions/3KF7_ORTHOSTERIC_L9G/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3KF7_ORTHOSTERIC_L9G_model_3.pdb, pred_3
load my_predictions/3KF7_ORTHOSTERIC_L9G/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3KF7_ORTHOSTERIC_L9G_model_4.pdb, pred_4
save ./tmp/3KF7_ORTHOSTERIC_L9G_exp.pdb, exp
delete all
load /home/ec2-user/SageMaker/datasets/asos_public/ground_truth/3new_chain_subset.cif, exp
sele not chain A+B
remove sele
load my_predictions/3NEW_ALLOSTERIC_3NE/model_0.pdb, pred_0
align pred_0, exp
save ./tmp/3NEW_ALLOSTERIC_3NE_model_0.pdb, pred_0
load my_predictions/3NEW_ALLOSTERIC_3NE/model_1.pdb, pred_1
align pred_1, exp
save ./tmp/3NEW_ALLOSTERIC_3NE_model_1.pdb, pred_1
load my_predictions/3NEW_ALLOSTERIC_3NE/model_2.pdb, pred_2
align pred_2, exp
save ./tmp/3NEW_ALLOSTERIC_3NE_model_2.pdb, pred_2
load my_predictions/3NEW_ALLOSTERIC_3NE/model_3.pdb, pred_3
align pred_3, exp
save ./tmp/3NEW_ALLOSTERIC_3NE_model_3.pdb, pred_3
load my_predictions/3NEW_ALLOSTERIC_3NE/model_4.pdb, pred_4
align pred_4, exp
save ./tmp/3NEW_ALLOSTERIC_3NE_model_4.pdb, pred_4
save ./tmp/3NEW_ALLOSTERIC_3NE_exp.pdb, exp
delete all

DROP VIEW LOGIS.VW_REP_RESUMEN_BULTOS_NUI_QA;

CREATE OR REPLACE FORCE VIEW LOGIS.VW_REP_RESUMEN_BULTOS_NUI_QA
(NUI, CANTIDAD_TARIMAS, BULTOS_CONSTITUTIVOS, BULTOS_CONSTITUTIVOS_CAJAS, CANTIDAD_CAJAS, 
 TOTAL, TOTAL_BULTOS, VOL_TOTAL_M3, VOL_TOTAL_M3_CAJAS, PESO, 
 PESO_CAJAS, TOT_M3, TOT_PESO)
AS 
( 
-- v002 ORSS 20240806 Se realiza ajuste para que los totales no se muestren en NULO
-- v003 ORSS 20240905 Se modifica la consulta para apuntar al paquete de spg_rep_cajas_tarimas_nui

     SELECT id_nui                     
          , cantidad_tarimas                             
          , bultos_consitutivos                          
          , bultos_constitutivos_cajas                   
          , cantidad_cajas                               
          , total                                        
          , total_bultos                                 
          , vol_total_m3                                 
          , VOL_TOTAL_M3_CAJAS                           
          , PESO                                         
          , PESO_CAJAS                                   
          , TOT_M3                                       
          , TOT_PESO         
       FROM web_ltl a 
       JOIN table( logis.SPG_REP_CAJAS_TARIMAS_NUI.f_obten_resumen_bultos_nui(a.welclave) ) b
         ON a.welclave = b.id_nui 
       
);


CREATE OR REPLACE PUBLIC SYNONYM VW_REP_RESUMEN_BULTOS_NUI_QA FOR LOGIS.VW_REP_RESUMEN_BULTOS_NUI_QA;


GRANT SELECT ON LOGIS.VW_REP_RESUMEN_BULTOS_NUI_QA TO PUBLIC;

/*----------------------------------------------------------------------------------*/
/* Product:            Visual Data Mining and Machine Learning                      */
/* Release Version:    V2023.01                                                     */
/* Component Version:  V2023.01                                                     */
/* CAS Version:        V.04.00M0P01172023                                           */
/* SAS Version:        V.04.00M0P011723                                             */
/* Site Number:        70180938                                                     */
/* Host:               sas-cas-server-default-client                                */
/* Encoding:           utf-8                                                        */
/* Java Encoding:      UTF8                                                         */
/* Locale:             en_US                                                        */
/* Project GUID:       c099929a-8b0e-4a46-9e67-075b5fa21895                         */
/* Node GUID:          c9bd0443-21b1-4d59-a16a-e35185f55c36                         */
/* Node Id:            BXYN6YT3CYU4CE4WA5GTNNZ1Y                                    */
/* Algorithm:          Logistic Regression                                          */
/* Generated by:       YiJian.Ching@sas.com                                         */
/* Date:               06MAR2023:08:04:15                                           */
/*----------------------------------------------------------------------------------*/
package MS_c9bd044321b14d59a16ae35185f55c36_06MAR2023080415351 / overwrite=yes;
   dcl double "Delinquencies";
   dcl double "P_Default0" having label n'Predicted: Default=0';
   dcl double "P_Default1" having label n'Predicted: Default=1';
   dcl nchar(12) "I_Default" having label n'Into: Default';
   dcl double "EM_EVENTPROBABILITY";
   dcl nchar(12) "EM_CLASSIFICATION";
   dcl double "EM_PROBABILITY";
   varlist allvars [_all_];
 
   method _BXYN6YT3CYU4CE4WA5GTNNZ1Y();
      dcl double _P_;
      dcl double MACLOGBIG;
      dcl double _J_;
      dcl double _I_;
      dcl double _TEMP_;
      dcl double _LINP_;
      dcl double _BADVAL_;
      dcl nchar(2) _DELINQUENCIES_;
      dcl nchar(12) _LEVELS_66456013_[2];
      dcl double _BETA_66456013_0_[11];
      dcl double _XROW_66456013_0_[11];
       
      _LEVELS_66456013_:=('1', '0');
      _BETA_66456013_0_:=(10.9023671851812, -13.600069917758, -13.0424333486775,
      -12.0810221815229, -13.3301154211293, -12.1551301536766, -10.055069324794,
      -4.1095457568212E-9, -4.268191757943E-9, 0, 0);
      _BADVAL_ = 0.0;
      _LINP_ = 0.0;
      _TEMP_ = 0.0;
      _I_ = 0.0;
      _J_ = 0.0;
      MACLOGBIG = 7.0978271289338392E+02;
      _DELINQUENCIES_ = LEFT(TRIM(put(DELINQUENCIES, BEST2.)));
      do _I_ = 1.0 to 11.0;
      _XROW_66456013_0_[_I_] = 0.0;
      end;
      _XROW_66456013_0_[1.0] = 1.0;
      _TEMP_ = 1.0;
      select (_DELINQUENCIES_);
      when ('0') _XROW_66456013_0_[2.0] = _TEMP_;
      when ('1') _XROW_66456013_0_[3.0] = _TEMP_;
      when ('2') _XROW_66456013_0_[4.0] = _TEMP_;
      when ('3') _XROW_66456013_0_[5.0] = _TEMP_;
      when ('4') _XROW_66456013_0_[6.0] = _TEMP_;
      when ('5') _XROW_66456013_0_[7.0] = _TEMP_;
      when ('6') _XROW_66456013_0_[8.0] = _TEMP_;
      when ('7') _XROW_66456013_0_[9.0] = _TEMP_;
      when ('8') _XROW_66456013_0_[10.0] = _TEMP_;
      when ('10') _XROW_66456013_0_[11.0] = _TEMP_;
      otherwise do ;
      _BADVAL_ = 1.0;
      goto SKIP_66456013_0;
      end;
      end;
      do _I_ = 1.0 to 11.0;
      _LINP_ + _XROW_66456013_0_[_I_] * _BETA_66456013_0_[_I_];
      end;
      SKIP_66456013_0: if (_BADVAL_ = 0.0) & ^MISSING(_LINP_) then do ;
      if (_LINP_ > 0.0) then do ;
      P_DEFAULT1 = 1.0 / (1.0 + EXP(-_LINP_));
      end;
      else do ;
      P_DEFAULT1 = EXP(_LINP_) / (1.0 + EXP(_LINP_));
      end;
      P_DEFAULT0 = 1.0 - P_DEFAULT1;
      if P_DEFAULT1 >= 0.5 then do ;
      I_DEFAULT = _LEVELS_66456013_[1.0];
      end;
      else do ;
      I_DEFAULT = _LEVELS_66456013_[2.0];
      end;
      end;
      else do ;
      _LINP_ = .;
      P_DEFAULT1 = .;
      P_DEFAULT0 = .;
      I_DEFAULT = ' ';
      end;
      if "P_DEFAULT1" = . then "P_DEFAULT1" = 0.0789224953;
      if "P_DEFAULT0" = . then "P_DEFAULT0" = 0.9210775047;
      if MISSING("I_DEFAULT") then do ;
      _P_ = 0.0;
      if "P_DEFAULT1" > _P_ then do ;
      _P_ = "P_DEFAULT1";
      "I_DEFAULT" = '           1';
      end;
      if "P_DEFAULT0" > _P_ then do ;
      _P_ = "P_DEFAULT0";
      "I_DEFAULT" = '           0';
      end;
      end;
      EM_EVENTPROBABILITY = "P_DEFAULT1";
      EM_CLASSIFICATION = "I_DEFAULT";
      EM_PROBABILITY = MAX("P_DEFAULT1", "P_DEFAULT0");
    
   end;
    
 
   method score(
      double "Delinquencies",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(12) "I_Default",
      IN_OUT double "P_Default0",
      IN_OUT double "P_Default1"
   );
      this."Delinquencies"= "Delinquencies";
 
      _BXYN6YT3CYU4CE4WA5GTNNZ1Y();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_Default"= this."I_Default";
      "P_Default0"= this."P_Default0";
      "P_Default1"= this."P_Default1";
   end;
 
 
   method predictedscore(
      double "Delinquencies",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(12) "I_Default",
      IN_OUT double "P_Default0",
      IN_OUT double "P_Default1"
   );
      this."Delinquencies"= "Delinquencies";
 
      _BXYN6YT3CYU4CE4WA5GTNNZ1Y();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_Default"= this."I_Default";
      "P_Default0"= this."P_Default0";
      "P_Default1"= this."P_Default1";
   end;
 
endpackage;
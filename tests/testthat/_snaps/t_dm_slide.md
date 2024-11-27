# Test demographic table creation of t_dm_slide

    Code
      t_dm_slide(adsl, "TRT01P", c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"))
    Output
      Demographic slide
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination   All Patients
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                    
        F                                            79 (59%)     82 (61.2%)       70 (53%)      231 (57.8%) 
        M                                            55 (41%)     52 (38.8%)       62 (47%)      169 (42.2%) 
      Age                                                                                                    
        Median                                         33.00         35.00          35.00           34.00    
        Min - Max                                   21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
      Race                                                                                                   
        ASIAN                                       68 (50.7%)     67 (50%)       73 (55.3%)      208 (52%)  
        BLACK OR AFRICAN AMERICAN                   31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
        WHITE                                       27 (20.1%)    26 (19.4%)      21 (15.9%)      74 (18.5%) 
        AMERICAN INDIAN OR ALASKA NATIVE              8 (6%)       11 (8.2%)       6 (4.5%)       25 (6.2%)  
        MULTIPLE                                         0         1 (0.7%)           0            1 (0.2%)  
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0            1 (0.2%)  
        OTHER                                            0             0              0               0      
        UNKNOWN                                          0             0              0               0      
      Ethnicity                                                                                              
         NOT REPORTED                                6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
        HISPANIC OR LATINO                          15 (11.2%)    18 (13.4%)      15 (11.4%)       48 (12%)  
        NOT HISPANIC OR LATINO                      104 (77.6%)   103 (76.9%)    101 (76.5%)      308 (77%)  
        UNKNOWN                                      9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
      Country                                                                                                
        CHN                                         74 (55.2%)    81 (60.4%)      64 (48.5%)     219 (54.8%) 
        USA                                          10 (7.5%)     13 (9.7%)      17 (12.9%)       40 (10%)  
        BRA                                          13 (9.7%)     7 (5.2%)       10 (7.6%)       30 (7.5%)  
        PAK                                           12 (9%)      9 (6.7%)       10 (7.6%)       31 (7.8%)  
        NGA                                           8 (6%)       7 (5.2%)       11 (8.3%)       26 (6.5%)  
        RUS                                          5 (3.7%)       8 (6%)         6 (4.5%)       19 (4.8%)  
        JPN                                          5 (3.7%)       4 (3%)         9 (6.8%)       18 (4.5%)  
        GBR                                           4 (3%)       3 (2.2%)        2 (1.5%)        9 (2.2%)  
        CAN                                          3 (2.2%)      2 (1.5%)        3 (2.3%)         8 (2%)   
        CHE                                              0             0              0               0      

---

    Code
      t_dm_slide(adsl, "TRT01P", c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"),
      side_by_side = 2)
    Output
      Demographic slide
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination   All Patients
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                    
        F                                            79 (59%)     82 (61.2%)       70 (53%)      231 (57.8%) 
        M                                            55 (41%)     52 (38.8%)       62 (47%)      169 (42.2%) 
      Age                                                                                                    
        Median                                         33.00         35.00          35.00           34.00    
        Min - Max                                   21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
      Race                                                                                                   
        ASIAN                                       68 (50.7%)     67 (50%)       73 (55.3%)      208 (52%)  
        BLACK OR AFRICAN AMERICAN                   31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
        WHITE                                       27 (20.1%)    26 (19.4%)      21 (15.9%)      74 (18.5%) 
        AMERICAN INDIAN OR ALASKA NATIVE              8 (6%)       11 (8.2%)       6 (4.5%)       25 (6.2%)  
        MULTIPLE                                         0         1 (0.7%)           0            1 (0.2%)  
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0            1 (0.2%)  
        OTHER                                            0             0              0               0      
        UNKNOWN                                          0             0              0               0      
      Ethnicity                                                                                              
         NOT REPORTED                                6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
        HISPANIC OR LATINO                          15 (11.2%)    18 (13.4%)      15 (11.4%)       48 (12%)  
        NOT HISPANIC OR LATINO                      104 (77.6%)   103 (76.9%)    101 (76.5%)      308 (77%)  
        UNKNOWN                                      9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
      Country                                                                                                
        CHN                                         74 (55.2%)    81 (60.4%)      64 (48.5%)     219 (54.8%) 
        USA                                          10 (7.5%)     13 (9.7%)      17 (12.9%)       40 (10%)  
        BRA                                          13 (9.7%)     7 (5.2%)       10 (7.6%)       30 (7.5%)  
        PAK                                           12 (9%)      9 (6.7%)       10 (7.6%)       31 (7.8%)  
        NGA                                           8 (6%)       7 (5.2%)       11 (8.3%)       26 (6.5%)  
        RUS                                          5 (3.7%)       8 (6%)         6 (4.5%)       19 (4.8%)  
        JPN                                          5 (3.7%)       4 (3%)         9 (6.8%)       18 (4.5%)  
        GBR                                           4 (3%)       3 (2.2%)        2 (1.5%)        9 (2.2%)  
        CAN                                          3 (2.2%)      2 (1.5%)        3 (2.3%)         8 (2%)   
        CHE                                              0             0              0               0      

---

    Code
      t_dm_slide(adsl, "TRT01P", c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"),
      split_by_study = TRUE, side_by_side = 2)
    Condition
      Warning in `build_table_header()`:
      split_by_study argument will be ignored
    Output
      Demographic slide
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination   All Patients
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                    
        F                                            79 (59%)     82 (61.2%)       70 (53%)      231 (57.8%) 
        M                                            55 (41%)     52 (38.8%)       62 (47%)      169 (42.2%) 
      Age                                                                                                    
        Median                                         33.00         35.00          35.00           34.00    
        Min - Max                                   21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
      Race                                                                                                   
        ASIAN                                       68 (50.7%)     67 (50%)       73 (55.3%)      208 (52%)  
        BLACK OR AFRICAN AMERICAN                   31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
        WHITE                                       27 (20.1%)    26 (19.4%)      21 (15.9%)      74 (18.5%) 
        AMERICAN INDIAN OR ALASKA NATIVE              8 (6%)       11 (8.2%)       6 (4.5%)       25 (6.2%)  
        MULTIPLE                                         0         1 (0.7%)           0            1 (0.2%)  
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0            1 (0.2%)  
        OTHER                                            0             0              0               0      
        UNKNOWN                                          0             0              0               0      
      Ethnicity                                                                                              
         NOT REPORTED                                6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
        HISPANIC OR LATINO                          15 (11.2%)    18 (13.4%)      15 (11.4%)       48 (12%)  
        NOT HISPANIC OR LATINO                      104 (77.6%)   103 (76.9%)    101 (76.5%)      308 (77%)  
        UNKNOWN                                      9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
      Country                                                                                                
        CHN                                         74 (55.2%)    81 (60.4%)      64 (48.5%)     219 (54.8%) 
        USA                                          10 (7.5%)     13 (9.7%)      17 (12.9%)       40 (10%)  
        BRA                                          13 (9.7%)     7 (5.2%)       10 (7.6%)       30 (7.5%)  
        PAK                                           12 (9%)      9 (6.7%)       10 (7.6%)       31 (7.8%)  
        NGA                                           8 (6%)       7 (5.2%)       11 (8.3%)       26 (6.5%)  
        RUS                                          5 (3.7%)       8 (6%)         6 (4.5%)       19 (4.8%)  
        JPN                                          5 (3.7%)       4 (3%)         9 (6.8%)       18 (4.5%)  
        GBR                                           4 (3%)       3 (2.2%)        2 (1.5%)        9 (2.2%)  
        CAN                                          3 (2.2%)      2 (1.5%)        3 (2.3%)         8 (2%)   
        CHE                                              0             0              0               0      

---

    Code
      t_dm_slide(adsl, "TRT01P", c("SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"),
      split_by_study = TRUE, side_by_side = 2)
    Condition
      Warning in `build_table_header()`:
      split_by_study argument will be ignored
    Output
      Demographic slide
      
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
                                                     A: Drug X    B: Placebo    C: Combination   All Patients
      ———————————————————————————————————————————————————————————————————————————————————————————————————————
      Sex                                                                                                    
        F                                            79 (59%)     82 (61.2%)       70 (53%)      231 (57.8%) 
        M                                            55 (41%)     52 (38.8%)       62 (47%)      169 (42.2%) 
      Age                                                                                                    
        Median                                         33.00         35.00          35.00           34.00    
        Min - Max                                   21.0 - 50.0   21.0 - 62.0    20.0 - 69.0     20.0 - 69.0 
      Race                                                                                                   
        ASIAN                                       68 (50.7%)     67 (50%)       73 (55.3%)      208 (52%)  
        BLACK OR AFRICAN AMERICAN                   31 (23.1%)    28 (20.9%)      32 (24.2%)      91 (22.8%) 
        WHITE                                       27 (20.1%)    26 (19.4%)      21 (15.9%)      74 (18.5%) 
        AMERICAN INDIAN OR ALASKA NATIVE              8 (6%)       11 (8.2%)       6 (4.5%)       25 (6.2%)  
        MULTIPLE                                         0         1 (0.7%)           0            1 (0.2%)  
        NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER        0         1 (0.7%)           0            1 (0.2%)  
        OTHER                                            0             0              0               0      
        UNKNOWN                                          0             0              0               0      
      Ethnicity                                                                                              
         NOT REPORTED                                6 (4.5%)      10 (7.5%)      11 (8.3%)       27 (6.8%)  
        HISPANIC OR LATINO                          15 (11.2%)    18 (13.4%)      15 (11.4%)       48 (12%)  
        NOT HISPANIC OR LATINO                      104 (77.6%)   103 (76.9%)    101 (76.5%)      308 (77%)  
        UNKNOWN                                      9 (6.7%)      3 (2.2%)        5 (3.8%)       17 (4.2%)  
      Country                                                                                                
        CHN                                         74 (55.2%)    81 (60.4%)      64 (48.5%)     219 (54.8%) 
        USA                                          10 (7.5%)     13 (9.7%)      17 (12.9%)       40 (10%)  
        BRA                                          13 (9.7%)     7 (5.2%)       10 (7.6%)       30 (7.5%)  
        PAK                                           12 (9%)      9 (6.7%)       10 (7.6%)       31 (7.8%)  
        NGA                                           8 (6%)       7 (5.2%)       11 (8.3%)       26 (6.5%)  
        RUS                                          5 (3.7%)       8 (6%)         6 (4.5%)       19 (4.8%)  
        JPN                                          5 (3.7%)       4 (3%)         9 (6.8%)       18 (4.5%)  
        GBR                                           4 (3%)       3 (2.2%)        2 (1.5%)        9 (2.2%)  
        CAN                                          3 (2.2%)      2 (1.5%)        3 (2.3%)         8 (2%)   
        CHE                                              0             0              0               0      

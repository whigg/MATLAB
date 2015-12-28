clc
clear all
close all

a=[543  964
 543  964
 543  964
 543  964
 543  964
 543  964
 543  964
 589  920
 589  920
 589  920
 589  920
 589  920
 589  920
 589  920
 589  920
 589  920
 589  920
 546  891
 546  891
 546  891
 500  866
 500  866
 500  866
 446  842
 446  842
 404  824
 404  824
 363  821
 363  821
 321  835
 321  835
 321  835
 268  900
 268  900
 238  969
 226 1009
 217 1051
 210 1097
 206 1145
 205 1189
 206 1232
 206 1232
 226 1304
 226 1304
 268 1345
 268 1345
 332 1340
 332 1340
 402 1290
 402 1290
 472 1208
 502 1157
 528 1106
 549 1052
 565 1000
 565 1000
 582  935
 582  935
 582  935
 582  935
 582  935
 582  935
 539  996
 539  996
 526 1072
 526 1115
 530 1155
 530 1155
 553 1221
 553 1221
 594 1272
 594 1272
 657 1291
 697 1285
 745 1269
 794 1247
 854 1218];
Na=size(a);


b=[ 273 1211
 273 1211
 273 1211
 286 1212
 286 1212
 307 1195
 323 1179
 340 1160
 363 1129
 385 1093
 416 1041
 446  990
 479  924
 514  858
 550  787
 587  710
 623  631
 653  562
 679  495
 698  430
 711  376
 716  330
 717  287
 711  257
 703  230
 693  209
 681  203
 667  203
 653  203
 638  218
 622  242
 605  275
 588  319
 570  369
 553  415
 535  477
 520  549
 504  616
 490  695
 476  770
 463  845
 453  923
 446 1001
 445 1068
 445 1125
 451 1175
 460 1212
 476 1242
 493 1265
 513 1275
 535 1280
 559 1282
 583 1277
 607 1263
 632 1247
 654 1224
 674 1197
 688 1166
 699 1132
 703 1098
 699 1060
 687 1026
 667  992
 639  969
 608  951
 573  943
 540  943
 507  952
 477  977
 455 1003
 445 1038
 438 1080
 442 1113];
Nb=size(b);

 c=[769  866
 769  866
 770  852
 770  852
 753  843
 743  838
 727  833
 711  825
 689  821
 667  812
 640  812
 614  810
 584  817
 555  823
 522  837
 490  853
 457  879
 427  908
 397  937
 372  970
 349 1005
 331 1040
 316 1083
 306 1119
 303 1153
 309 1187
 319 1220
 339 1246
 366 1268
 400 1280
 439 1285
 481 1288
 528 1279
 571 1270
 609 1258
 643 1246
 663 1237];
Nc=size(c);

 d=[608  880
 608  880
 608  880
 602  866
 602  866
 586  853
 575  841
 560  838
 545  832
 526  829
 508  831
 486  836
 467  850
 445  864
 423  887
 402  909
 384  935
 365  970
 349 1003
 335 1042
 323 1078
 317 1115
 315 1145
 318 1173
 326 1193
 339 1204
 357 1207
 381 1195
 409 1176
 440 1142
 475 1103
 510 1050
 547  995
 581  929
 616  856
 649  783
 679  704
 706  630
 731  543
 752  462
 769  381
 783  314
 792  254
 796  206
 796  164
 796  164
 796  164
 770  126
 756  144
 737  171
 720  206
 701  243
 683  294
 665  353
 650  417
 636  492
 621  566
 609  645
 596  730
 584  817
 573  909
 566  996
 560 1081
 561 1150
 568 1209
 577 1254
 595 1288
 618 1309
 643 1315
 670 1306
 706 1291
 738 1276
 770 1257];
Nd=size(d);

e=[ 326 1081
 326 1081
 311 1087
 311 1087
 297 1093
 297 1093
 297 1093
 298 1104
 308 1102
 321 1102
 339 1090
 361 1079
 385 1067
 411 1053
 439 1032
 466 1012
 492  994
 517  971
 539  956
 556  939
 570  922
 581  906
 586  894
 588  880
 585  865
 576  856
 563  847
 546  840
 527  834
 504  829
 481  827
 457  828
 433  830
 407  837
 387  841
 367  847
 351  853
 335  864
 323  879
 312  897
 306  914
 300  936
 297  958
 294  991
 293 1021
 294 1059
 296 1094
 300 1126
 305 1156
 316 1181
 329 1203
 344 1215
 361 1225
 382 1225
 402 1224
 424 1218
 443 1212
 460 1201
 475 1189
 486 1180
 486 1180
 497 1172
 497 1172
 497 1172
 497 1172
 483 1169
 483 1169
 471 1178
 471 1178
 461 1181
 461 1181
 461 1181
 461 1181
 461 1181
 461 1181
 461 1181
 461 1181
 461 1181
 470 1183
 470 1183
 480 1184
 480 1184
 493 1186
 493 1186
 502 1180];
Ne=size(e);

f=[ 409 1177
 400 1186
 388 1200
 388 1200
 388 1200
 388 1200
 403 1183
 422 1162
 450 1129
 484 1088
 526 1035
 567  975
 610  907
 650  836
 690  757
 722  679
 748  602
 765  530
 774  456
 776  395
 775  333
 767  284
 767  284
 745  214
 732  188
 717  179
 703  178
 689  188
 677  215
 664  251
 653  297
 640  355
 628  426
 613  505
 599  592
 584  689
 566  793
 545  900
 520 1014
 490 1135
 457 1254
 421 1375
 381 1499
 336 1615
 290 1722
 247 1820
 208 1901
 173 1962
 143 2005
 121 2021
 103 2016
  94 1989
  93 1940
  97 1879
 113 1804
 132 1724
 159 1642
 192 1558
 234 1477
 281 1399
 337 1327
 397 1261
 457 1200
 517 1144
 570 1096
 616 1053
 660 1023
 687 1008
 707 1002];
Nf=size(f);

g=[ 675  882
 675  882
 675  882
 685  869
 685  869
 681  848
 672  845
 663  836
 648  833
 634  827
 615  824
 598  821
 578  821
 557  817
 536  814
 514  817
 491  827
 467  837
 441  854
 417  873
 391  898
 368  928
 345  966
 327  999
 314 1036
 309 1066
 312 1098
 322 1122
 340 1138
 366 1146];
Ng=size(g);

k=600;

a(Na(1):Na(1)+Nb(1)-1,:)=[b(:,1)+k b(:,2)];
Na=size(a);

a(Na(1):Na(1)+Nc(1)-1,:)=[c(:,1)+2*k c(:,2)];
Na=size(a);

a(Na(1):Na(1)+Nd(1)-1,:)=[d(:,1)+3*k d(:,2)];
Na=size(a);

a(Na(1):Na(1)+Ne(1)-1,:)=[e(:,1)+4*k e(:,2)];
Na=size(a);

a(Na(1):Na(1)+Nf(1)-1,:)=[f(:,1)+5*k f(:,2)];
Na=size(a);

a(Na(1):Na(1)+Ng(1)-1,:)=[g(:,1)+6*k g(:,2)];
Na=size(a);

for n=1:Na(1)
    xy(:,n)=[a(n,1);a(n,2)];
    plot(double(a(n,1)),double(a(n,2)),'ro')
hold on
end

t = 1:n;
ts = 1: 0.5: n;
xys = spline(t,xy,ts);
plot(xys(1,:),xys(2,:),'b-');












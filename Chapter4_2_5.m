%%%%%%%%%%%%%%%%%%%%%%%%%%%Chapter4_2_5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件用于评价分类模型性能                            %
%                         作者：余道洪                                         %
%                         修改日期：2023.3.15                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
OvO_SVM = [30 1 2;2 33 2;1 0 47];
OvR_SVM = [30 1 2;0 33 4;0 0 48];
ECOC_SVM = [27 3 3;0 33 4;0 0 48];

TP1 =diag(OvO_SVM);
TP2 =diag(OvR_SVM);
TP3 =diag(ECOC_SVM);

Accuracy_OvO = sum(TP1)/sum(OvO_SVM(:));
Accuracy_OvR = sum(TP2)/sum(OvR_SVM(:));
Accuracy_ECOC = sum(TP3)/sum(ECOC_SVM(:));


PPV_OvO = TP1./sum(OvO_SVM)';
PPV_OvR = TP2./sum(OvR_SVM)';
PPV_ECOC = TP3./sum(ECOC_SVM)';

TPR_OvO = TP1./sum(OvO_SVM,2);
TPR_OvR = TP2./sum(OvO_SVM,2);
TPR_ECOC = TP3./sum(OvO_SVM,2);


F1_OvO = 2*(TPR_OvO.*PPV_OvO)./(TPR_OvO+PPV_OvO);
F1_OvR = 2*(TPR_OvR.*PPV_OvR)./(TPR_OvR+PPV_OvR);
F1_ECOC = 2*(TPR_ECOC.*PPV_ECOC)./(TPR_ECOC+PPV_ECOC);
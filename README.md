# Terraform
Terraform training

Ce projet a été réalisé dans un processus d'entrainement à la maitrise de l'outils IaC Terraform.

Contexte: On se positionne dans le cadre d'une entreprise qui souhaite déployer des ressources de façon rapide et automatique sur sa souscription Azure Cloud afin que
son équipe puisse en bénéficier et y accéder rapidement



LE PLAN:

1-Deployer un resource group avec le nom "groupe-X" et la location : West Europe. Toutes les ressources du controle seront à déployer dans votre resource group.
 
2-Deployer un keyvault 

3-Déployer un VNET et deux Subnet

4-Déployer un SQL Serveur 

5-Déployer une base de donnée sur votre SQL Serveur en General Purpose Serverless 1VCORE, MAX SYZE GIGA 20, AUTO PAUSE 1HR30. 

6-Déployer un Storage Account et 1 conteneur. Ajouter un firewall sur votre storage account avec votre IP PUBLIC et tous vos subnets. 

7-Générer une SAS KEY sur votre conteneur et un output complet de l'url.

8-Utiliser mon Log Analytics "log-controle" pour y envoyer les Metrics (et seulement les Metrics) de votre Keyvault.

9-Déployer 1 VM Ubuntu 20.04 avec une clé SSH (ou TLS) stocké dans un secret Keyvault. La size de la VM = "Standard_B1ls". Attribuer à la VM une IP privée du subnet1 et une ip public.

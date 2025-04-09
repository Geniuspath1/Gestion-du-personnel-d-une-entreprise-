# Modèle créé le : Tue Apr 08 14:02:10 CEST 2025 

POSTE (<u>id-poste</u>,
 titre,
 description,
 salaire-base) 

EMPLOYE (<u>id-employe</u>,
 nom,
 prenom,
 sexe,
 date-naissance,
 email,
 telephone,
 adresse,
 date-embauche,
 #id-departement_,
 #id-poste,
 #id-contrat) 

DEPARTEMENT (<u>id-departement_</u>,
 nom-departement,
 description-dep) 

CONGE (<u>id-conge</u>,
 date-debutconge,
 date-finconge,
 type-conge,
 statut_,
 #id-employe) 

FORMATION_ (<u>id-formation</u>,
 titre-formation,
 organisme,
 date-debutformation,
 date-finformation_) 

CONTRAT (<u>id-contrat</u>,
 type-contrat,
 date-debutcontrat,
 date-fincontrat,
 statut,
 #id-employe) 

EVALUATION (<u>id-evaluation</u>,
 date-evaluation,
 note,
 commentaire) 

suit (<u>id-formation</u>,
 <u>id-employe</u>) 

evalue (<u>id-evaluation</u>,
 <u>id-employe</u>) 


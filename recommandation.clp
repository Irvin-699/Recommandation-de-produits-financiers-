(deftemplate portefeuille
  (slot investisseur_id)
  (multislot produits))

(deftemplate recommandation
  (slot produit)
  (slot confiance)
  (slot raison))

(defrule recommander-totalenergies-1
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_CAC40" $?p)))
  (not (portefeuille (produits $?q&:(member$ "TotalEnergies" $?q))))
  =>
  (assert (recommandation (produit "TotalEnergies")
    (confiance 0.71)
    (raison "Détient : LVMH, Airbus, BNP_Paribas, ETF_CAC40"))))

(defrule recommander-lvmh-2
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_CAC40" $?p)))
  (not (portefeuille (produits $?q&:(member$ "LVMH" $?q))))
  =>
  (assert (recommandation (produit "LVMH")
    (confiance 0.75)
    (raison "Détient : Airbus, TotalEnergies, BNP_Paribas, ETF_CAC40"))))

(defrule recommander-lvmh-3
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "LVMH" $?q))))
  =>
  (assert (recommandation (produit "LVMH")
    (confiance 0.73)
    (raison "Détient : Airbus, TotalEnergies, BNP_Paribas"))))

(defrule recommander-lvmh-4
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_CAC40" $?p)))
  (not (portefeuille (produits $?q&:(member$ "LVMH" $?q))))
  =>
  (assert (recommandation (produit "LVMH")
    (confiance 0.73)
    (raison "Détient : Airbus, TotalEnergies, ETF_CAC40"))))

(defrule recommander-lvmh-5
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_CAC40" $?p)))
  (not (portefeuille (produits $?q&:(member$ "LVMH" $?q))))
  =>
  (assert (recommandation (produit "LVMH")
    (confiance 0.71)
    (raison "Détient : Airbus, BNP_Paribas, ETF_CAC40"))))

(defrule recommander-etf_cac40-6
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.82)
    (raison "Détient : LVMH, Airbus, TotalEnergies, BNP_Paribas"))))

(defrule recommander-etf_cac40-7
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.81)
    (raison "Détient : LVMH, TotalEnergies, Airbus"))))

(defrule recommander-microsoft-8
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.74)
    (raison "Détient : ETF_Technologie, Apple, Amazon, Tesla"))))

(defrule recommander-etf_cac40-9
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.8)
    (raison "Détient : LVMH, Airbus, BNP_Paribas"))))

(defrule recommander-etf_cac40-10
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.8)
    (raison "Détient : Airbus, TotalEnergies, BNP_Paribas"))))

(defrule recommander-microsoft-11
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.73)
    (raison "Détient : Apple, Amazon, Tesla"))))

(defrule recommander-etf_cac40-12
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.79)
    (raison "Détient : LVMH, TotalEnergies, BNP_Paribas"))))

(defrule recommander-microsoft-13
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.72)
    (raison "Détient : ETF_Technologie, Apple, Tesla"))))

(defrule recommander-apple-14
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.8)
    (raison "Détient : ETF_Technologie, Microsoft, Amazon, Tesla"))))

(defrule recommander-microsoft-15
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.72)
    (raison "Détient : ETF_SP500, Apple, Amazon, Tesla"))))

(defrule recommander-etf_cac40-16
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.78)
    (raison "Détient : ETF_Monde, LVMH, TotalEnergies, BNP_Paribas"))))

(defrule recommander-microsoft-17
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.71)
    (raison "Détient : ETF_Technologie, Amazon, Tesla"))))

(defrule recommander-microsoft-18
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.71)
    (raison "Détient : ETF_Technologie, Apple, ETF_SP500, Tesla"))))

(defrule recommander-microsoft-19
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.71)
    (raison "Détient : ETF_Monde, Apple, Amazon, Tesla"))))

(defrule recommander-apple-20
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.79)
    (raison "Détient : Amazon, Microsoft, Tesla"))))

(defrule recommander-microsoft-21
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.7)
    (raison "Détient : ETF_Technologie, ETF_SP500, Amazon, Tesla"))))

(defrule recommander-apple-22
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.78)
    (raison "Détient : ETF_Technologie, Microsoft, Tesla"))))

(defrule recommander-microsoft-23
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Microsoft" $?q))))
  =>
  (assert (recommandation (produit "Microsoft")
    (confiance 0.7)
    (raison "Détient : ETF_Technologie, Apple, Amazon"))))

(defrule recommander-apple-24
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.78)
    (raison "Détient : ETF_SP500, Microsoft, Amazon, Tesla"))))

(defrule recommander-etf_cac40-25
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : LVMH, TotalEnergies, ETF_Energie_Verte"))))

(defrule recommander-apple-26
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.78)
    (raison "Détient : ETF_Technologie, Amazon, Tesla"))))

(defrule recommander-etf_cac40-27
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : LVMH, Airbus, ETF_Energie_Verte"))))

(defrule recommander-etf_cac40-28
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : Airbus, TotalEnergies"))))

(defrule recommander-etf_cac40-29
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : Airbus, TotalEnergies, ETF_Energie_Verte"))))

(defrule recommander-etf_cac40-30
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Obligations" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : LVMH, Airbus, ETF_Obligations"))))

(defrule recommander-etf_technologie-31
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.73)
    (raison "Détient : Apple, Microsoft, Amazon, Tesla"))))

(defrule recommander-etf_cac40-32
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : LVMH, Airbus"))))

(defrule recommander-etf_cac40-33
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.76)
    (raison "Détient : LVMH, TotalEnergies"))))

(defrule recommander-apple-34
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.77)
    (raison "Détient : ETF_Technologie, ETF_SP500, Microsoft, Tesla"))))

(defrule recommander-etf_cac40-35
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.75)
    (raison "Détient : LVMH, Airbus, ETF_Immobilier"))))

(defrule recommander-apple-36
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.77)
    (raison "Détient : ETF_Technologie, Amazon, Microsoft"))))

(defrule recommander-etf_technologie-37
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.73)
    (raison "Détient : ETF_SP500, Apple, Microsoft, Tesla"))))

(defrule recommander-apple-38
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.77)
    (raison "Détient : ETF_Technologie, ETF_SP500, Amazon, Tesla"))))

(defrule recommander-etf_technologie-39
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.73)
    (raison "Détient : Apple, Amazon, Tesla"))))

(defrule recommander-etf_technologie-40
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : Apple, Microsoft, Tesla"))))

(defrule recommander-etf_technologie-41
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : ETF_SP500, Apple, Amazon, Tesla"))))

(defrule recommander-etf_cac40-42
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.75)
    (raison "Détient : TotalEnergies, BNP_Paribas, ETF_Energie_Verte"))))

(defrule recommander-etf_cac40-43
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : Airbus, BNP_Paribas"))))

(defrule recommander-etf_technologie-44
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : Apple, Microsoft, Amazon"))))

(defrule recommander-etf_technologie-45
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : ETF_Monde, Apple, Amazon, Tesla"))))

(defrule recommander-etf_technologie-46
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : ETF_SP500, Apple, Microsoft, Amazon"))))

(defrule recommander-apple-47
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.76)
    (raison "Détient : ETF_Monde, Microsoft, Amazon, Tesla"))))

(defrule recommander-etf_technologie-48
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : ETF_SP500, Amazon, Microsoft, Tesla"))))

(defrule recommander-etf_cac40-49
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : Airbus, TotalEnergies, ETF_Immobilier"))))

(defrule recommander-etf_cac40-50
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : LVMH, BNP_Paribas, ETF_Energie_Verte"))))

(defrule recommander-etf_technologie-51
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : Amazon, Microsoft, Tesla"))))

(defrule recommander-etf_technologie-52
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.72)
    (raison "Détient : ETF_Monde, Apple, Microsoft, Tesla"))))

(defrule recommander-etf_cac40-53
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : LVMH, TotalEnergies, ETF_Immobilier"))))

(defrule recommander-etf_cac40-54
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Obligations" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : Airbus, TotalEnergies, ETF_Obligations"))))

(defrule recommander-apple-55
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : ETF_Technologie, Microsoft, ETF_SP500, Amazon"))))

(defrule recommander-etf_technologie-56
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.71)
    (raison "Détient : ETF_SP500, Apple, Tesla"))))

(defrule recommander-apple-57
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : ETF_SP500, Microsoft, Tesla"))))

(defrule recommander-apple-58
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : Microsoft, Tesla"))))

(defrule recommander-etf_technologie-59
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.71)
    (raison "Détient : ETF_Monde, ETF_SP500, Apple, Tesla"))))

(defrule recommander-apple-60
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : ETF_Monde, ETF_Technologie, Microsoft, Tesla"))))

(defrule recommander-apple-61
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : ETF_SP500, Amazon, Tesla"))))

(defrule recommander-etf_cac40-62
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Obligations" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : LVMH, TotalEnergies, ETF_Obligations"))))

(defrule recommander-apple-63
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.75)
    (raison "Détient : Amazon, Tesla"))))

(defrule recommander-etf_cac40-64
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : TotalEnergies, BNP_Paribas"))))

(defrule recommander-etf_cac40-65
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : ETF_Monde, LVMH, TotalEnergies"))))

(defrule recommander-etf_cac40-66
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.74)
    (raison "Détient : ETF_Monde, LVMH, Airbus"))))

(defrule recommander-etf_cac40-67
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.73)
    (raison "Détient : ETF_Monde, Airbus, TotalEnergies"))))

(defrule recommander-etf_technologie-68
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.71)
    (raison "Détient : ETF_SP500, Microsoft, Tesla"))))

(defrule recommander-etf_technologie-69
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.71)
    (raison "Détient : ETF_SP500, Amazon, Tesla"))))

(defrule recommander-etf_cac40-70
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.73)
    (raison "Détient : LVMH, BNP_Paribas"))))

(defrule recommander-etf_cac40-71
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.73)
    (raison "Détient : Airbus, ETF_Immobilier, BNP_Paribas"))))

(defrule recommander-etf_cac40-72
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.73)
    (raison "Détient : ETF_Monde, Airbus, BNP_Paribas"))))

(defrule recommander-apple-73
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.74)
    (raison "Détient : ETF_Monde, ETF_Technologie, Amazon, Tesla"))))

(defrule recommander-etf_technologie-74
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.7)
    (raison "Détient : ETF_Monde, ETF_SP500, Microsoft, Tesla"))))

(defrule recommander-etf_technologie-75
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.7)
    (raison "Détient : Amazon, Tesla"))))

(defrule recommander-etf_technologie-76
  (portefeuille (produits $?p&:(member$ "Apple" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_Technologie" $?q))))
  =>
  (assert (recommandation (produit "ETF_Technologie")
    (confiance 0.7)
    (raison "Détient : Apple, Tesla"))))

(defrule recommander-etf_cac40-77
  (portefeuille (produits $?p&:(member$ "Airbus" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Obligations" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.72)
    (raison "Détient : Airbus, ETF_Obligations, BNP_Paribas"))))

(defrule recommander-etf_cac40-78
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.72)
    (raison "Détient : ETF_Monde, TotalEnergies, BNP_Paribas"))))

(defrule recommander-apple-79
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.74)
    (raison "Détient : ETF_Technologie, Tesla"))))

(defrule recommander-apple-80
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.74)
    (raison "Détient : ETF_SP500, Tesla, ETF_Technologie"))))

(defrule recommander-etf_cac40-81
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.72)
    (raison "Détient : LVMH, ETF_Immobilier, BNP_Paribas"))))

(defrule recommander-apple-82
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : ETF_Monde, ETF_Technologie, Microsoft, Amazon"))))

(defrule recommander-etf_cac40-83
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.72)
    (raison "Détient : ETF_Monde, LVMH, BNP_Paribas"))))

(defrule recommander-apple-84
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : ETF_Technologie, ETF_SP500, Microsoft"))))

(defrule recommander-apple-85
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : Amazon, Microsoft"))))

(defrule recommander-apple-86
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : ETF_Technologie, Microsoft"))))

(defrule recommander-apple-87
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : ETF_SP500, Amazon, Microsoft"))))

(defrule recommander-apple-88
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.73)
    (raison "Détient : ETF_Monde, ETF_SP500, Microsoft, Tesla"))))

(defrule recommander-apple-89
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Energie_Verte" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.72)
    (raison "Détient : Microsoft, Tesla, ETF_Energie_Verte"))))

(defrule recommander-apple-90
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.72)
    (raison "Détient : ETF_Technologie, Amazon"))))

(defrule recommander-apple-91
  (portefeuille (produits $?p&:(member$ "ETF_Monde" $?p)))
  (portefeuille (produits $?p&:(member$ "Microsoft" $?p)))
  (portefeuille (produits $?p&:(member$ "Tesla" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.72)
    (raison "Détient : ETF_Monde, Microsoft, Tesla"))))

(defrule recommander-etf_cac40-92
  (portefeuille (produits $?p&:(member$ "TotalEnergies" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Immobilier" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.71)
    (raison "Détient : TotalEnergies, ETF_Immobilier, BNP_Paribas"))))

(defrule recommander-etf_cac40-93
  (portefeuille (produits $?p&:(member$ "LVMH" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Obligations" $?p)))
  (portefeuille (produits $?p&:(member$ "BNP_Paribas" $?p)))
  (not (portefeuille (produits $?q&:(member$ "ETF_CAC40" $?q))))
  =>
  (assert (recommandation (produit "ETF_CAC40")
    (confiance 0.71)
    (raison "Détient : LVMH, ETF_Obligations, BNP_Paribas"))))

(defrule recommander-apple-94
  (portefeuille (produits $?p&:(member$ "ETF_SP500" $?p)))
  (portefeuille (produits $?p&:(member$ "Amazon" $?p)))
  (portefeuille (produits $?p&:(member$ "ETF_Technologie" $?p)))
  (not (portefeuille (produits $?q&:(member$ "Apple" $?q))))
  =>
  (assert (recommandation (produit "Apple")
    (confiance 0.72)
    (raison "Détient : ETF_SP500, Amazon, ETF_Technologie"))))


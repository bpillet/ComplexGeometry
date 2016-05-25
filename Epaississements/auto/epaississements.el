(TeX-add-style-hook "epaississements"
 (lambda ()
    (LaTeX-add-bibliographies
     "~/Git/Bibliography/full")
    (LaTeX-add-labels
     "sec-1"
     "sec-2"
     "epaississementiteratif"
     "symmetricconormal"
     "sec-3"
     "sec-3-1"
     "sec-3-2"
     "sec-3-3"
     "sec-3-4")
    (TeX-add-symbols
     '("alert" 1))
    (TeX-run-style-hooks
     "fontenc"
     "T1"
     "inputenc"
     "utf8x"
     "/home/basile/Git/Latex/Headfiles/amsdip"
     "draft"
     "couleur"
     "latex2e"
     "amsart10"
     "amsart"
     "a4paper")))


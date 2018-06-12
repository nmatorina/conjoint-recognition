# Simplified Conjoint Recognition Paradigm (Stahl & Klauer, 2008) using MPTinR package
# MPTinR restricts parameters to be > 0 and < 1 by default so no additional restrictions necessary

library(MPTinR)

mod_simplif_cr <-
"#Tree for target probes, first target responses, then related, then new
Vt + (1-Vt)*Gt*a + (1-Vt)*(1-Gt)*b*a
(1-Vt)*Gt*(1-a) + (1-Vt)*(1-Gt)*b*(1-a)
(1-Vt)*(1-Gt)*(1-b)

#Tree for related probes, first target responses, then related, then new
(1-Vr)*Gr*a + (1-Vr)*(1-Gr)*b*a
Vr + (1-Vr)*Gr*(1-a) + (1-Vr)*(1-Gr)*b*(1-a)
(1-Vr)*(1-Gr)*(1-b)

#Tree for unrelated probes, first target responses, then related, then new
b*a
b*(1-a)
(1-b)"

#Check Model
check.mpt(textConnection(mod_simplif_cr))

#Example Data
df <- c(5,5,4,7,9,2,3,3,3)

#Model Fit
modelfit <- fit.mpt(df, textConnection(mod_simplif_cr))




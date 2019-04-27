+++
date = "2019-04-26T20:41:40+00:00"
draft = true
undefined = ""

+++
# Over-fitting: o que é e como evita-la.

No aprendizado de máquina supervisionado, os modelos são treinados em um subconjunto de dados, também conhecidos como dados de treinamento. O objetivo é calcular a meta de cada exemplo de treinamento a partir dos dados de treinamento.

Agora, o overfitting acontece quando o modelo aprende sinais e ruídos nos dados de treinamento e não tem um bom desempenho em novos dados sobre os quais o modelo não foi treinado. No exemplo abaixo, você pode ver underfitting nas primeiras etapas e overfitting nos últimos poucos.

![](/uploads/fig-2-underfit-optimum-overfit.png)

Se o número de variáveis for muito alto, existe uma probabilidade de que o preenchimento de hipóteses seja adequado a todos os pontos nos dados de treinamento. Pode parecer uma coisa boa de acontecer, mas tem resultados contraditórios. Suponha que uma hipótese de alto grau seja adequada a um conjunto de pontos, de modo que todos os pontos se situem na hipótese. O gráfico abaixo mostra um caso de overfitting com uma regressão da ordem 100.

Agora, há poucas maneiras de evitar o overfitting de seu modelo em dados de treinamento, como amostragem de validação cruzada, redução do número de recursos, poda, regularização, etc.

A regularização basicamente adiciona a penalidade à medida que a complexidade do modelo aumenta. O parâmetro de regularização (lambda) penaliza todos os parâmetros, exceto interceptar, de modo que o modelo generaliza os dados e não supera o overfit.

Na imagem acima, conforme a complexidade aumenta, a regularização adicionará a penalidade por termos mais altos. Isso diminuirá a importância dada aos termos mais altos e trará o modelo para uma equação menos complexa.
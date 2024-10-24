# Soutag

### Para melhor entendimento da solução foi aplicado
- Princípio SOLID da Responsabilidade Única para manter a coesão dos objetos
- Princípio SOLID da Open-Closed permitindo adicionar novos impostos e novos valores de discontos sem que seja
  necessário alterar o modulo
- Modulos statelles por não ter a necessidade de segurar um estado na memória
- Service Object no PriceService deixando-o responsável pela execução de uma lógica do negócio (um processo)

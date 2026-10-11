# Projeto — Márcia Thais (Landing Page)

## O que é
Landing page pessoal da consultora imobiliária Márcia Thais, baseada na LP Aritan Especialista.
Vitrine com os empreendimentos do curyoficial.com (em lançamento e lançados), simulador MCMV/SBPE e captação de leads.

## Papel do Claude
Responder como desenvolvedor sênior: entender o problema, propor arquitetura,
apontar riscos, só então implementar. Código limpo, modular e seguro.

## Stack
HTML/CSS/JS estático, sem build. Fontes Montserrat + Inter. Paleta azul #1452E6 / #0B3BB0, preto #0A0A0B, branco.
- `index.html` página · `obrigado.html` · `politica-de-privacidade.html`
- `config.js` dados únicos das 3 páginas (WhatsApp, e-mails, Instagram, CRECI, GA_ID, PIXEL_ID)
- `img/marcia.png` foto · `img/emp/` fotos locais (as demais vêm do CDN cury.net)
- Repositório: github.com/kaizen-cury/marciathais · Publicar: `PUBLICAR-MARCIA.command`

## Contatos e integrações
- WhatsApp (21) 99412-9700 · marciathaiscorretoradeimoveis@gmail.com · Instagram @marciathais.corretora
- Formulário → formsubmit.co → kaizen.cury@gmail.com (1º envio pede ativação por e-mail)

## Conversão (padrão curyoficial.com)
- Formulário vai para obrigado.html?tipo=form; todo botão de WhatsApp vai para obrigado.html?tipo=whatsapp.
- O obrigado dispara Pixel Lead/Contact e GA4 uma vez por lead e abre o WhatsApp (4s form, 2s WhatsApp).
- Empreendimentos: array `EMP` no fim do index.html (status 'lancamento' ou 'lancado').

## Preferências de resposta
- Direto, sem introdução longa. Bullet points.
- Sem jargão de IA e sem travessão.
- Sempre terminar com um próximo passo.

## Memória e entregas
- Memória e decisões deste projeto: `Cerebro-Claude/01-Projetos/Projeto - Marcia Thais (LP).md` no vault.
- Toda entrega relevante também é registrada no vault do Obsidian.

## Pendências
- CRECI da Márcia · GA4 e Pixel (opcionais) · Netlify/domínio.

## Regras fixas
- Atualizar a base de conhecimento (Obsidian + memória) ANTES de qualquer alteração ou publicação.
- Backup antes de alterar arquivos de código.
- Nunca commitar `.env`, tokens ou segredos.

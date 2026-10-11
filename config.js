/* =========================================================
   CONFIGURAÇÃO ÚNICA · Márcia Thais
   Usada pela página principal, pela página de obrigado
   e pela política de privacidade. Altere só aqui.
========================================================= */
window.CFG = {
  NOME: 'Márcia Thais',
  WA: '5521994129700',                         /* WhatsApp só com dígitos */
  FONE_TXT: '(21) 99412-9700',
  EMAIL_CONTATO: 'marciathaiscorretoradeimoveis@gmail.com',
  EMAIL_LEADS: 'kaizen.cury@gmail.com',        /* recebe os cadastros do formulário */
  INSTAGRAM: 'marciathais.corretora',
  CRECI: 'CRECI 57813/O RJ',
  GA_ID: '',                                   /* ex.: G-XXXXXXXXXX (vazio = desligado) */
  PIXEL_ID: ''                                 /* ex.: 1234567890 (vazio = desligado) */
};

/* Google Analytics 4 + Meta Pixel (só ativam com ID preenchido) */
(function(c){
  if (c.GA_ID && c.GA_ID.indexOf('G-') === 0) {
    var s = document.createElement('script'); s.async = true;
    s.src = 'https://www.googletagmanager.com/gtag/js?id=' + c.GA_ID; document.head.appendChild(s);
    window.dataLayer = window.dataLayer || []; window.gtag = function(){ dataLayer.push(arguments); };
    gtag('js', new Date()); gtag('config', c.GA_ID);
  }
  if (c.PIXEL_ID) {
    !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', c.PIXEL_ID); fbq('track', 'PageView');
  }
})(window.CFG);

/* Leva o visitante para a página de obrigado (padrão curyoficial.com).
   Nome e telefone não vão na URL: ficam só na sessão do navegador. */
window.irObrigado = function(tipo, dados){
  dados = dados || {};
  var id = 'lead_' + Date.now() + '_' + Math.random().toString(36).slice(2, 8);
  try {
    sessionStorage.setItem('ty_lead', JSON.stringify({
      id: id, tipo: tipo || 'form', nome: dados.nome || '', msg: dados.msg || '',
      origem: dados.origem || 'pagina', empreendimento: dados.emp || '', ts: Date.now()
    }));
  } catch (e) {}
  setTimeout(function(){
    location.href = 'obrigado.html?tipo=' + (tipo || 'form') + '&origem=' + encodeURIComponent(dados.origem || 'pagina');
  }, dados.delay == null ? 150 : dados.delay);
};

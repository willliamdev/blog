---
title: Currículo
---

<div class="hx-flex hx-flex-col hx-items-center hx-justify-center hx-py-24 hx-text-center">

<div class="hx-mb-6">
{{< hextra/hero-badge >}}
  <div class="hx-w-2 hx-h-2 hx-rounded-full hx-bg-primary-400"></div>
  <span>Baixando automaticamente...</span>
{{< /hextra/hero-badge >}}
</div>

<div class="hx-mb-10">
{{< hextra/hero-subtitle >}}
  Se o download não começar sozinho em alguns segundos,&nbsp;<br class="sm:hx-block hx-hidden" />
  clica no botão abaixo
{{< /hextra/hero-subtitle >}}
</div>

<div class="hx-mb-3 hx-mt-2">
{{< hextra/hero-button text="Abrir currículo" link="/files/cv.pdf" >}}
</div>

<a href="/files/cv.pdf"
   download="Curriculo-William-Amorim.pdf"
   class="hx-text-sm hx-text-gray-500 hover:hx-text-primary-600 hx-underline hx-underline-offset-4 dark:hx-text-gray-400">
   ou baixar direto o PDF
</a>

</div>

<script>
  (function () {
    var link = document.createElement('a');
    link.href = '/files/cv.pdf';
    link.download = 'Curriculo-William-Amorim.pdf';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  })();
</script>
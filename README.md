# Teste — animação em código no GitHub Actions

Cena de teste "E se a gravidade desligasse?" (8 segundos, 720x1280),
animada 100% em código com Three.js, renderizada no cloud grátis.

## Como rodar

1. Abra a aba **Actions** deste repositório.
2. Clique em **Renderizar cena de teste** na esquerda.
3. Clique em **Run workflow** e depois no botão verde **Run workflow**.
4. Aguarde uns 5 minutos. O vídeo sai em **Artifacts** com o nome
   `teste-gravidade` (arquivo `teste-gravidade.mp4`).

## Arquivos

- `cena.html` — a cena (Three.js, determinística por `?t=`).
- `three.min.js` — Three.js r128 local (sem depender de CDN).
- `render.sh` — renderiza os 120 frames com Chrome headless.
- `.github/workflows/render.yml` — o fluxo do Actions.

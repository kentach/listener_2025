document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("hamburger-btn");
  const menu = document.getElementById("hamburger-menu");
  const overlay = document.getElementById("menu-overlay");

  if (!btn) return; // ページによっては存在しない場合がある

  btn.addEventListener("click", () => {
    const isOpen = btn.classList.toggle("active");
    menu.classList.toggle("open");
    overlay.classList.toggle("active");

    btn.setAttribute("aria-expanded", isOpen);
  });

  overlay.addEventListener("click", () => {
    btn.classList.remove("active");
    menu.classList.remove("open");
    overlay.classList.remove("active");
    btn.setAttribute("aria-expanded", "false");
  });
});

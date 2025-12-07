document.addEventListener("turbo:load", () => {
  const tabs = document.querySelectorAll(".tab");
  const panes = document.querySelectorAll(".tab-pane");

  tabs.forEach(tab => {
    tab.addEventListener("click", () => {
      const target = tab.dataset.target;

      tabs.forEach(t => t.classList.remove("active"));
      tab.classList.add("active");

      panes.forEach(pane => {
        pane.classList.toggle("active", pane.id === target);
      });
    });
  });
});
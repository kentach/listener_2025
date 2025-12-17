document.addEventListener("turbo:load", () => {
  const audio = document.getElementById("audio");
  if (!audio) return;

  // ===== DOM =====
  const playBtn = document.getElementById("playBtn");
  const playIcon = document.getElementById("playIcon");
  const rewind3 = document.getElementById("rewind3");
  const forward3 = document.getElementById("forward3");
  const loopBtn = document.getElementById("loopBtn");
  const speedControl = document.getElementById("speedControl");
  const progress = document.getElementById("progress");
  const currentTime = document.getElementById("currentTime");
  const duration = document.getElementById("duration");

  // ===== helper =====
  const formatTime = (time) => {
    const min = Math.floor(time / 60);
    const sec = Math.floor(time % 60).toString().padStart(2, "0");
    return `${min}:${sec}`;
  };

  // ===== 再生 / 一時停止 =====
  playBtn.onclick = () => {
    audio.paused ? audio.play().catch(() => {}) : audio.pause();
  };

  audio.addEventListener("play", () => {
    playIcon.classList.remove("bi-play-fill");
    playIcon.classList.add("bi-pause-fill");
  });

  audio.addEventListener("pause", () => {
    playIcon.classList.remove("bi-pause-fill");
    playIcon.classList.add("bi-play-fill");
  });

  audio.addEventListener("ended", () => {
    playIcon.classList.remove("bi-pause-fill");
    playIcon.classList.add("bi-play-fill");
  });

  // ===== 3秒戻る / 進む =====
  rewind3.onclick = () => {
    audio.currentTime = Math.max(0, audio.currentTime - 3);
  };

  forward3.onclick = () => {
    audio.currentTime = Math.min(audio.duration || 0, audio.currentTime + 3);
  };

  // ===== ループ =====
  loopBtn.onclick = () => {
    audio.loop = !audio.loop;
    loopBtn.classList.toggle("active", audio.loop);
  };

  // ===== 再生速度 =====
  speedControl.onchange = () => {
    audio.playbackRate = parseFloat(speedControl.value);
  };

  // ===== 進捗バー =====
  audio.ontimeupdate = () => {
    if (!audio.duration) return;

    progress.value = (audio.currentTime / audio.duration) * 100;
    currentTime.textContent = formatTime(audio.currentTime);
    duration.textContent = formatTime(audio.duration);
  };

  progress.oninput = () => {
    if (audio.duration) {
      audio.currentTime = (progress.value / 100) * audio.duration;
    }
  };

  // ===== カードクリックで音声切り替え =====
  document.querySelectorAll(".card[data-audio-url]").forEach(card => {
    card.onclick = () => {
      const url = card.dataset.audioUrl;
      if (!url) return;

      audio.pause();
      audio.currentTime = 0;
      audio.src = url;
      audio.load();

      audio.addEventListener("canplaythrough", function handler() {
        audio.removeEventListener("canplaythrough", handler);
        audio.play().catch(() => {});
      }, { once: true });
    };
  });
});

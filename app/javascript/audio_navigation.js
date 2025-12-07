document.addEventListener("turbo:load", () => {
  const audio = document.getElementById("audio");
  if (!audio) return; // audioタグがないページでは処理しない

  // DOM要素
  const playBtn = document.getElementById("playBtn");
  const rewind3 = document.getElementById("rewind3");
  const forward3 = document.getElementById("forward3");
  const loopBtn = document.getElementById("loopBtn");
  const speedControl = document.getElementById("speedControl");
  const progress = document.getElementById("progress");
  const currentTime = document.getElementById("currentTime");
  const duration = document.getElementById("duration");

  // --- ヘルパー関数 ---
  const formatTime = (time) => {
    const min = Math.floor(time / 60);
    const sec = Math.floor(time % 60).toString().padStart(2, "0");
    return `${min}:${sec}`;
  };

  // --- 再生 / 一時停止 ---
  playBtn.onclick = () => {
    if (audio.paused) {
      audio.play().catch(() => {}); // AbortErrorを無視
      playBtn.textContent = "❚❚";
    } else {
      audio.pause();
      playBtn.textContent = "▶︎";
    }
  };

  // --- 3秒戻る / 進む ---
  rewind3.onclick = () => audio.currentTime = Math.max(0, audio.currentTime - 3);
  forward3.onclick = () => audio.currentTime = Math.min(audio.duration, audio.currentTime + 3);

  // --- ループ切り替え ---
  loopBtn.onclick = () => {
    audio.loop = !audio.loop;
    loopBtn.classList.toggle("active", audio.loop);
  };

  // --- 再生速度変更 ---
  speedControl.onchange = () => {
    audio.playbackRate = parseFloat(speedControl.value);
  };

  // --- 進捗バー更新 ---
  audio.ontimeupdate = () => {
    if (audio.duration) {
      const percent = (audio.currentTime / audio.duration) * 100;
      progress.value = percent;
      currentTime.textContent = formatTime(audio.currentTime);
      duration.textContent = formatTime(audio.duration);
    }
  };

  // --- シークバー操作 ---
  progress.oninput = () => {
    if (audio.duration) {
      audio.currentTime = (progress.value / 100) * audio.duration;
    }
  };

  // --- カードクリック（イベント委譲で多重登録防止） ---
  document.addEventListener("turbo:load", () => {
  const audio = document.getElementById("audio");
  if (!audio) return;

  // 既存イベントリスナーを削除して多重登録防止
  audio.oncanplaythrough = null;

  document.querySelectorAll(".card[data-audio-url]").forEach(card => {
    card.onclick = () => {
      const url = card.getAttribute("data-audio-url");
      if (!url) return;

      audio.pause();
      audio.currentTime = 0;
      audio.src = url;
      audio.load();

      // canplaythrough で再生
      audio.addEventListener("canplaythrough", function handler() {
        audio.removeEventListener("canplaythrough", handler);
        audio.play().catch(e => console.log("再生エラー:", e));
      }, { once: true });
    };
  });
});
});
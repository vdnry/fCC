const butts = Array.from(document.querySelectorAll(".drum-pad"));
const p = document.getElementById("display");
const keys = { };
for (const i in butts) {
  const butt = butts[i];
  const audio = butt.querySelector("audio");
  const letter = audio.getAttribute("id");
  keys[letter] = audio;
  butt.addEventListener("click", () => {
    audio.currentTime = 0;
    audio.play();
    p.innerText = letter;
  })
}

document.addEventListener("keydown", (e) => {
  const letter = e.key.toUpperCase();
  if (keys[letter]) {
    keys[letter].currentTime = 0;
    keys[letter].play();
    p.innerText = letter;
  }
});
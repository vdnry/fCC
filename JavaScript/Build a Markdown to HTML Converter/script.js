const mdIn = document.getElementById("markdown-input");
const htmlOut = document.getElementById("html-output");
const preview = document.getElementById("preview");

function convertMarkdown() {
  const h1 = /^# .*/;
  const h2 = /^## .*/;
  const h3 = /^### .*/;
  const quote = /^> .*/;
  const bold = /(?<!\*)\*{2}((?!\*{2}).+)\*{2}(?!\*)/g;
  const bold2 = /(?<!_)_{2}((?!_{2}).+)_{2}(?!_)/g;
  const em = /(?<!\*)\*([^*]+)\*(?!\*)/g;
  const em2 = /(?<!_)_([^_]+)_(?!_)/g;
  const img = /!\[(.*)\]\((.*)\)/g;
  const link = /(?<!!)\[(.*)\]\((.*)\)/g;
  const lbArr = mdIn.value.split("\n");
  for (let i = 0; i < lbArr.length; i++) {
    const s = lbArr[i];
    if (h1.test(s)) lbArr[i] = "<h1>" + s.slice(2,) +"</h1>";
    else if (h2.test(s)) lbArr[i] = "<h2>" + s.slice(3,) +"</h2>";
    else if (h3.test(s)) lbArr[i] = "<h3>" + s.slice(4,) +"</h3>";
    else if (quote.test(s)) lbArr[i] = "<blockquote>" + s.slice(2,) +"</blockquote>";
  }
  for (let i = 0; i < lbArr.length; i++) {
    let arr = lbArr[i].split(bold);
    for (let j = 1; j < arr.length; j+=2) arr[j] = "<strong>" + arr[j] + "</strong>";
    lbArr[i] = arr.join("");

    arr = lbArr[i].split(bold2);
    for (let j = 1; j < arr.length; j+=2) arr[j] = "<strong>" + arr[j] + "</strong>";
    lbArr[i] = arr.join("");

    arr = lbArr[i].split(em);
    for (let j = 1; j < arr.length; j+=2) arr[j] = "<em>" + arr[j] + "</em>";
    lbArr[i] = arr.join("");

    arr = lbArr[i].split(em2);
    for (let j = 1; j < arr.length; j+=2) arr[j] = "<em>" + arr[j] + "</em>";
    lbArr[i] = arr.join("");

    arr = lbArr[i].split(img);
    for (let j = 1; j < arr.length; j+=3) {
      arr[j] = '<img alt="' + arr[j] + '"src="' + arr[j+1] + '">';
      arr[j+1] = "";
    }
    lbArr[i] = arr.join("");

    arr = lbArr[i].split(link);
    for (let j = 1; j < arr.length; j+=3) {
      arr[j] = '<a href="' + arr[j+1] + '">' + arr[j] + '</a>';
      arr[j+1] = "";
    }
    lbArr[i] = arr.join("");
  }
  const lbStr = lbArr.join("\n");
  return lbStr;
}

mdIn.addEventListener("input", () => {
  const str = convertMarkdown();
  htmlOut.textContent = str;
  preview.innerHTML = str;
});
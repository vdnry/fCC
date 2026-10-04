const flashcard = document.getElementById("flashcard")!;
const deleteBtn = document.getElementById("delete-btn")!;
const questionText = document.getElementById("question-text")!;
const questionAnswer = document.getElementById("question-answer")!;
const frontText = document.getElementById("front-text") as HTMLTextAreaElement;
const backText = document.getElementById("back-text") as HTMLTextAreaElement;
const entryForm = document.getElementById("entry-form")!;

const InvalidUserInputError = new Error("Bad Input");

interface FlashCard {
  questionText: string;
  questionAnswer: string;
}

const currentCards: FlashCard[] = [];

flashcard.addEventListener("click", () => {
  flashcard.classList.toggle("flipped");
  if (flashcard.classList.contains("flipped")) {
    questionText.style.display = "none";
    questionAnswer.style.display = "block";
  } else {
    questionText.style.display = "block";
    questionAnswer.style.display = "none";
  }
});

deleteBtn.addEventListener("click", () => {
  currentCards.pop();
  if (currentCards.length > 0) {
    questionText.textContent = currentCards[currentCards.length-1].questionText;
    questionAnswer.textContent = currentCards[currentCards.length-1].questionAnswer;
  } else {
    questionText.textContent = "No flashcards currently";
    questionAnswer.textContent = "Try adding a flashcard";
  }
});

entryForm.addEventListener("submit", (e) => {
  e.preventDefault();
  if (frontText.value && backText.value) {
    currentCards.push({
      questionText: frontText.value,
      questionAnswer: backText.value
    });
    questionText.textContent = frontText.value;
    questionAnswer.textContent = backText.value;
  } else {
    throw InvalidUserInputError;
  }
  
});
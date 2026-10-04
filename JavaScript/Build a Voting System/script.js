const poll = new Map();

const addOption = option => {
  if (!option) return `Option cannot be empty.`;
  if (!poll.has(option)) {
    poll.set(option, new Set());
    return `Option "${option}" added to the poll.`;
  } else return `Option "${option}" already exists.`;  
}

const vote = (option, voterId) => {
  if (!poll.has(option)) return `Option "${option}" does not exist.`;
  if (poll.get(option).has(voterId)) return `Voter ${voterId} has already voted for "${option}".`;
  else {
    poll.get(option).add(voterId);
    return `Voter ${voterId} voted for "${option}".`;
  }
}

const displayResults = () => {
  let s = 'Poll Results:\n';
  for (const i of poll.entries()) {
    s += `${i[0]}: ${i[1].size} votes\n`;
  }
  s = s.slice(0, s.length - 1);
  return s;
}

console.log(addOption('A'));
console.log(addOption('B'));
console.log(addOption('C'));
console.log(vote('A', 1));
console.log(vote('B', 2));
console.log(vote('C', 3));
console.log(vote('B', 4));
console.log(displayResults())
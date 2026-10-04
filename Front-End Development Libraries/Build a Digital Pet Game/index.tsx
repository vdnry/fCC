const { useState, useEffect } = React;

export const PetGame = () => {
  enum PetMood {
    HAPPY,
    EXCITED,
    CONTENT,
    SAD,
    TIRED,
    SICK,
    HUNGRY
  }
  
  const moods: Record<PetMood, string> = {
    [PetMood.HAPPY]: "Happy",
    [PetMood.EXCITED]: "Excited",
    [PetMood.CONTENT]: "Content",
    [PetMood.SAD]: "Sad",
    [PetMood.TIRED]: "Tired",
    [PetMood.SICK]: "Sick",
    [PetMood.HUNGRY]: "Hungry"
  }

  const [name, setName] = useState("");
  const [hideGame, setHideGame] = useState(true);
  const [hunger, setHunger] = useState(0);
  const [energy, setEnergy] = useState(100);
  const [happiness, setHappiness] = useState(100);
  const [status, setStatus] = useState(moods[PetMood.EXCITED]);

  const checkStatus = () => {
    if (hunger > 70) setStatus(moods[PetMood.HUNGRY]);
    else if (energy < 30) setStatus(moods[PetMood.TIRED]);
    else if (happiness < 30) setStatus(moods[PetMood.SAD]);
    else if (happiness > 80 && energy > 70) setStatus(moods[PetMood.EXCITED]);
    else if (happiness > 60) setStatus(moods[PetMood.HAPPY]);
    else setStatus(moods[PetMood.CONTENT]);
  }

  useEffect(() => {
    const t = setInterval(() => {
      if (energy < 100) setEnergy(energy + 10);
      if (hunger < 100) setHunger(hunger + 10);
      if (happiness > 0) setHappiness(happiness - 10);
      checkStatus();
    }, 3000);
    return () => clearInterval(t);
  }), [hideGame];


  return (
    <>
      <form onSubmit={(e) => {
        e.preventDefault();
        setName(e.currentTarget.querySelector("input")!.value);
        setHideGame(false);
        e.currentTarget.remove();
      }}>
        <input id="pet-name" type="text" required value={name} onChange={(e) => setName(e.target.value)} />
        <button type="submit">Start Game!</button>
      </form>
      <section hidden={hideGame}>
        <p className="pet-name">{name}</p>
        <p>Mood: {status}</p>
        <p className="stat">Hunger: <span className="stat-value">{hunger}</span></p>
        <p className="stat">Energy: <span className="stat-value">{energy}</span></p>
        <p className="stat">Happiness: <span className="stat-value">{happiness}</span></p>
        <button id="eat-action" onClick={() => {
          if (hunger > 0) setHunger(hunger - 10);
          if (energy < 100) setEnergy(energy + 10);
          checkStatus();
        }}>EAT</button>
        <button id="play-action" onClick={() => {
          if (energy > 0) setEnergy(energy - 10);
          if (happiness < 100) setHappiness(happiness + 10);
          checkStatus();
        }}>PLAY</button>
        <button id="sleep-action" onClick={() => {
          if (energy < 100) setEnergy(energy + 10);
          if (hunger < 100) setHunger(hunger + 10);
          checkStatus();
        }}>SLEEP</button>
      </section>
    </>
  )
};
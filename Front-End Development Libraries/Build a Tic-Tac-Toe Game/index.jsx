const { useState } = React;

export function Board() {
  const w = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]];
  const arr = [1,2,3,4,5,6,7,8,9];
  const obj = {};
  const antiObj = {};
  for (const i of arr) obj[i] = false;
  for (const i of arr) antiObj[i] = true;
  const [object, setObject] = useState(obj);
  const [tog, setTog] = useState(true);
  const [x, setX] = useState([]);
  const [o, setO] = useState([]);
  const [winner, setWinner] = useState("");

  const play = i => {
    let newX = x;
    let newO = o;
    setTog(!tog);
    setObject({...object, [i]: true});
    tog ? newX = [...x, i] : newO = [...o, i];
    tog ? setX(newX) : setO(newO);
    for (const i of w) {
      if (i.every((j) => newX.includes(j))) {
        setObject(antiObj);
        setWinner("Winner: X");
        return;
      }
      if (i.every((j) => newO.includes(j))) {
        setObject(antiObj);
        setWinner("Winner: O");
        return;
      }
      if (newX.length + newO.length == 9) {
        setObject(antiObj);
        setWinner("Winner: Draw");
        return;
      }
    }
    setWinner("");
  }

  const reset = () => {
    setTog(true);
    setX([]);
    setO([]);
    setObject(obj);
  }

  return (
    <>
      <div style={{display: "grid", gridTemplateColumns: "90px 90px 90px", justifyContent: "center", margin: "10px"}}>
        {arr.map(i => 
        <button style={{width: "90px", height: "90px"}} 
                key={"button-"+i} 
                className="square"
                onClick={() => {
                  play(i);
                }}
                disabled={object[i]}>
          {x.includes(i) ? "X" : (o.includes(i)) ? "O" : ""}
        </button>
        )}
      </div>
      <button id="reset" onClick={reset}>Reset Game</button>
      <p>{winner}</p>
    </>
  )
}
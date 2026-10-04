const { useState, useMemo } = React;

export function CurrencyConverter() {
  const [mon, setMon] = useState(1)
  const [cur, setCur] = useState("USD");
  const [cur2, setCur2] = useState("EUR");
  const obj = {
    "USD": 1,
    "EUR": 0.85,
    "GBP": 0.75,
    "JPY": 110
  };

  const convert = useMemo(() => {
      const c = {}
      for (const i of Object.keys(obj))
        c[i] = ((obj[i] / obj[cur]) * mon).toFixed(2);
      return c;
    }
  , [mon, cur]);

  const show = () => convert[cur2]

  return (
    <>
      <input value={mon} onChange={e => setMon(e.target.value)} type="number"/>
      <select value={cur} onChange={e => {setCur(e.target.value);}}>
        {Object.keys(obj).map((x) => <option value={x} key={x}>{x}</option>)}
      </select>
      <select value={cur2} onChange={e => {setCur2(e.target.value); show()}}>
        {Object.keys(obj).map((x) => <option value={x} key={x}>{x}</option>)}
      </select>
      <p>{show()} {cur2}</p>
    </>
  )
}
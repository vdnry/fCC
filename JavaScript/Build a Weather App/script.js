const getWeatherBtn = document.getElementById("get-weather-btn");
const city = document.getElementById("city");
const weatherIcon = document.getElementById("weather-icon");
const mainTemperature = document.getElementById("main-temperature");
const feelsLike = document.getElementById("feels-like");
const humidity = document.getElementById("humidity");
const wind = document.getElementById("wind");
const windGust = document.getElementById("wind-gust");
const weatherMain = document.getElementById("weather-main");
const loc = document.getElementById("location");

getWeatherBtn.addEventListener("click", () => {
  if (city.value) showWeather(city.value);
})

async function getWeather(city) {
  try {
    const res = await fetch("https://weather-proxy.freecodecamp.rocks/api/city/" + city);
    const data = await res.json();
    return data;
  } catch (e) {
    console.log("Error: " + e);
  }
}

async function showWeather(city) {
  try {
    const data = await getWeather(city);
    weatherIcon.setAttribute("src", data.weather[0].icon);
    mainTemperature.textContent = "Temperature: " + (data.main.temp ? data.main.temp + "° C" : "N/A");
    feelsLike.textContent = "Feels Like: " + (data.main.feels_like ? data.main.feels_like + "° C" : "N/A");
    humidity.textContent = "Humidity: " + (data.main.humidity ? data.main.humidity + "%" : "N/A");
    wind.textContent = "Wind: " + (data.wind.speed ? data.wind.speed + " m/s" : "N/A");
    windGust.textContent = "Wind Gust: " + (data.wind.gust ? data.wind.gust + " m/s" : "N/A");
    weatherMain.textContent = "Type: " + (data.weather[0].main ? data.weather[0].main: "N/A");
    loc.textContent = "Location: " + (data.name ? data.name : "N/A")
  } catch(e) {
    alert("Something went wrong, please try again later")
  }
}
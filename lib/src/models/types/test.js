var films = Array();
films = [
  {
    id: "item1",
    cover: "img/Black_adam.png",
    title: "Black Adam",
    description: ["Action", "Fantastique", "ScienceFiction"],
    isFavorite: false,
    likes: 0,
  },

  {
    id: "item2",
    cover: "img/Jurasic_Park.png",
    title: "jurasic Park",
    description: ["Action", "Fantastique", "ScienceFiction"],
    isFavorite: false,
    likes: 0,
  },
];
var container_mov = document.createElement("div");
container_mov.classList.add("container-mov");
for (let film in films) {
  let mov_html = `<div class="mov", id="${film["id"]}">
                        <img src="${film["cover"]}">
                        <h3>${film["title"]}</h3>
                        <div class ="${film["description"].map(e=>e).join(', ')}"></div>
                        <button onclick=addToFavorite(${
                          film["id"]
                        })>ajouter aux favoris</button>
                        <button onclick=like(${film["id"]})>J'aime (${film["likes"]})</button>
                    </div>`;

  container_mov.innerHTML += mov_html;
}

function addToFavorite(filmId) {
  for (let film in films)
    if (film["id"] == filmId) film["isFavorite"] = !film["isFavorite"];
}
function like(filmId) {
  for (let film in films) if (film["id"] == filmId) film["likes"]++;
}

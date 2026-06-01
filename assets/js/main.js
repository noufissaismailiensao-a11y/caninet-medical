// ═══════════════════════════════════════
//  DATE ET HEURE EN DIRECT
// ═══════════════════════════════════════
const jours = ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'];
const mois  = ['Janvier','Février','Mars','Avril','Mai','Juin',
                'Juillet','Août','Septembre','Octobre','Novembre','Décembre'];

function afficherDate() {
  const el = document.getElementById('current-date');
  if (!el) return;

  const now = new Date();
  el.textContent =
    jours[now.getDay()] + ' ' +
    now.getDate() + ' ' +
    mois[now.getMonth()] + ' ' +
    now.getFullYear() + ' — ' +
    now.toLocaleTimeString('fr-FR');
}

afficherDate();
setInterval(afficherDate, 1000);


// ═══════════════════════════════════════
//  CALENDRIER DU MOIS
// ═══════════════════════════════════════
function construireCalendrier() {
  const conteneur = document.getElementById('calendrier');
  const titreEl   = document.getElementById('cal-titre');
  if (!conteneur) return;

  const now        = new Date();
  const annee      = now.getFullYear();
  const moisIndex  = now.getMonth();
  const aujourdhui = now.getDate();

  // Titre du mois
  if (titreEl) titreEl.textContent = mois[moisIndex] + ' ' + annee;

  // En-têtes jours
  const entetes = ['Lu','Ma','Me','Je','Ve','Sa','Di'];
  entetes.forEach(j => {
    const div = document.createElement('div');
    div.className   = 'cal-head';
    div.textContent = j;
    conteneur.appendChild(div);
  });

  // Décalage du premier jour (lundi = 0)
  const premierJour = new Date(annee, moisIndex, 1).getDay();
  const decalage    = premierJour === 0 ? 6 : premierJour - 1;

  for (let i = 0; i < decalage; i++) {
    const div = document.createElement('div');
    div.className = 'cal-day vide';
    conteneur.appendChild(div);
  }

  // Jours du mois
  const nbJours = new Date(annee, moisIndex + 1, 0).getDate();

  for (let j = 1; j <= nbJours; j++) {
    const div = document.createElement('div');
    div.textContent = j;

    if (j === aujourdhui) {
      div.className = 'cal-day aujourd-hui';
    } else {
      div.className = 'cal-day';
    }

    conteneur.appendChild(div);
  }
}

construireCalendrier();
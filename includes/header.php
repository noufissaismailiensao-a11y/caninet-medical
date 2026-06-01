<nav class="navbar navbar-expand-lg sticky-top">
  <div class="container-fluid px-4">

    <!-- Logo + nom cabinet -->
    <a class="navbar-brand d-flex align-items-center gap-2" href="#">
      <div class="brand-icon">
        <i class="fa-solid fa-stethoscope"></i>
      </div>
      <div>
        <div class="brand-name">Cabinet Médical</div>
        <div class="brand-sub">Al Amal – Espace Admin</div>
      </div>
    </a>

    <!-- Bouton mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navMenu">
      <ul class="navbar-nav align-items-center gap-2 py-2 py-lg-0">

        <!-- Badge admin -->
        <li class="nav-item">
          <div class="admin-badge">
            <div class="admin-av">A</div>
            <span>Administrateur</span>
          </div>
        </li>

        <!-- Gérer patients -->
        <li class="nav-item">
          <a href="../pages/patients.php" class="nav-pill nav-pill-outline">
            <i class="fa-solid fa-users"></i>
            <span>Gérer patients</span>
          </a>
        </li>

        <!-- Gérer RDV -->
        <li class="nav-item">
          <a href="../pages/rendez_vous.php" class="nav-pill nav-pill-outline">
            <i class="fa-solid fa-calendar-check"></i>
            <span>Gérer RDV</span>
          </a>
        </li>

        <!-- Déconnexion -->
        <li class="nav-item">
          <a href="../logout.php" class="nav-pill nav-pill-red">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Déconnexion</span>
          </a>
        </li>

      </ul>
    </div>

  </div>
</nav>
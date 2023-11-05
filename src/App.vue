<template>
  <v-app>
    <v-navigation-drawer
      class="bg-deep-purple"
      theme="dark" app>
      <Navigation
        class="bg-deep-purple"
        theme="dark"
        permanent  />
    </v-navigation-drawer>

    <v-app-bar app>
      <h3> SIRI Custom Dashboard </h3>
    </v-app-bar>

    <v-main>
      <!-- Main content area -->
      <router-view></router-view>
    </v-main>

    <v-footer app>
      <!-- Footer content goes here -->
    </v-footer>
  </v-app>
</template>

<script setup>
  //
import Navigation from "@/components/Navigation.vue";
</script>

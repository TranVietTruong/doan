<template>
  <v-container class="fill-height">
    <v-row
      class=" mt-n12"
      justify="center"
    >
      <v-col
        class="text-center"
        cols="auto"
      >
        <v-img
          class="mb-12"
          contain
          height="256"
          src="https://discordapp.com/assets/81d74b2ebb053fbccee41865a47d48c3.svg"
        />
        <h1 class="display-4 font-weight-bold mb-6">
          Error ! 404
        </h1>

        <p class="mb-12 display-1 grey--text text--darken-2">
          không tìm thấy trang 
        </p>

        <v-btn
          color="primary"
          x-large
          outlined
          to="/"
        >
          trang chủ

          <v-icon right>
            mdi-open-in-new
          </v-icon>
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

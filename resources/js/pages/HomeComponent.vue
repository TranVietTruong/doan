<template>
    <div>
        <v-app-bar absolute color="transparent">
			<VAvatar
				
			>
				<img src="https://discordapp.com/assets/81d74b2ebb053fbccee41865a47d48c3.svg">
			</VAvatar>
			<v-toolbar-title class="subtitle-2 font-weight-bold text-uppercase">tư vấn khởi nghiệp</v-toolbar-title>
			<VSpacer/>
			<VIcon class="mr-3">mdi-gmail</VIcon>
				
			<VIcon class="mr-3">mdi-facebook</VIcon>
		
			<VIcon class="mr-3">mdi-account-box</VIcon> 

			<VIcon class="mr-3">mdi-instagram</VIcon> 
		</v-app-bar>
        <v-content>
            <v-img  
                max-height="100vh"  
                height="100vh"
                src='https://material-portfolio-dark.vuetifyjs.com/img/hero.e530afc6.png'
            >
                <vContainer>
                    <div class="d-flex justify-center" style="margin-top:150px !important">
                        <div class="text-center">

                            <h1 class="text-uppercase font-weight-bold mt-12 mb-5">
                                tư vấn khởi nghiệp
                            </h1>
                            <p style="color:#E0E0E0">Hãy chia sẻ câu chuyện của bạn cho chúng tôi, chúng tôi sẽ chia sẻ câu chuyện của chúng tôi cho bạn</p>
                            <div class="mt-6 mb-12">

                                <VBtn to="/dang-nhap" min-width="150px" color="pink darken-2" outlined large class="mr-5">Đăng Nhập</VBtn>
                                <VBtn to="/dang-ky" min-width="150px" color="green darken-2" outlined large>Đăng Ký</VBtn>
                            </div>
                            
                           <!--  <div class="fire">
                                <img src='https://cdn.sstatic.net/Img/home/accelerate.svg?v=9d4c2786ff02' width="150px" alt="">
                            </div> -->
                            
                        </div>
                    </div>    
                    
                </vContainer>
            </v-img>
        </v-content>

    
        <v-footer
            absolute
            elevation="12"
            padless>
            <v-row
            justify="center"
            no-gutters
            class=" grey darken-3 "
            >

                <v-col
                    class="grey darken-4 py-3 text-center white--text caption"
                    cols="12"
                >
                    {{ new Date().getFullYear() }} — <strong>Đồ án tốt nghiệp</strong>
                </v-col>
            </v-row>
        </v-footer>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                
            }
        }
    };
</script>

<style>
    .v-btn__content{
        color: white !important;
    }
    .fire{
        position: absolute;
        top: 80%;
        left: 45%;
        transform: translateX(-50%);
        animation: flys 60s linear infinite;
        z-index: -1;
        transform: rotate(-45deg);
    }

    @keyframes fly {
      0%{
           top: 80%;   
      }
      25%{
            top: 60%;
            
      } 
    
      50%{
            top: 40%; 
            animation-duration: 2s;
      }
      75%{
            top: 20%;
           
            
      }
      90%{
            top: 0%;
            
      }
      100%{
            top: -25%; 
            
           
      }
    }

</style>
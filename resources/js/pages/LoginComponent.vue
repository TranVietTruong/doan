<template>
	<div id='login'>
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
				<v-container
				class="fill-height"
				fluid
				>
					<v-row
					align="center"
					justify="center"
					>
						<v-col
						cols="6"
						
						>
							<v-card 
								class="text-center"
								elevation="12"
							>
								<!-- <VCardTitle class="mb-5 mt-3">
									Đăng Nhập
								</VCardTitle> -->
								
								<v-card-text>
									<div class="d-flex justify-content-center ma-5">
										<div>
											<p class="font-weight-bold title text-uppercase" style="color:white">Đăng Nhập</p>
											<VTooltip left color="#3578E5">
                                    			<template v-slot:activator="{on}">  
													<VBtn class="ma-1" v-on="on"><v-icon color="#3578E5">mdi-facebook</v-icon></VBtn>
												</template>
												<span>Đăng nhập bằng facebook</span>
											</VToolTip> 

											<VTooltip right color="red">
                                    			<template v-slot:activator="{on}">  
													<VBtn class="ma-1" v-on="on"><v-icon color="red">mdi-google</v-icon></VBtn>
												</template>
												<span>Đăng nhập bằng google</span>
											</VToolTip>      

											
										</div>	
									</div>
									<v-form  v-model="formValid">
										<v-text-field
											ref="username"
											v-model="username"
											color="white"
											label="Tên tài khoản"
											outlined
											clearable
											prepend-inner-icon="mdi-account"
											:rules="[
												() => !!username || 'Tên tài khoản không được để trống',
											]"
										/>

										<v-text-field
											:rules="[
												() => !!password || 'Mật khẩu không được để trống',
											]"
											color="white"
											v-model="password"
											clearable
											outlined
											:append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
											:type="show ? 'text' : 'password'"
											label="Password"
											prepend-inner-icon="mdi-lock"
											@click:append="show = !show"
										/>
										<div class="d-flex justify-end">
											
											<a href="">Quên mật khẩu ?</a>
										</div>
										
										<div class="d-flex justify-center mt-2">
											<div>
												<VBtn
													:disabled="!formValid"
													@click="login"
													large>
													Đăng Nhập
												</VBtn>
												<p class="mt-6">Bạn chư có tài khoản?
													<router-link tag="a" :to="{name:'register'}">Đăng ký tại đây</router-link>	
												</p> 
											</div>
										</div>
											
									</v-form>
									
								</v-card-text>
								
							</v-card>
						</v-col>
					</v-row>
				</v-container>
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

<script scoped>
	import {mapActions} from 'vuex';

	export default{
		data(){
			return{
				show: false,
				username: null,
				password: null,
				formValid: true,
			}
		},
		methods:{
			...mapActions(['attempt']),

			login(){
				let credentials = {
					username:this.username,
					password:this.password
				}
				this.attempt(credentials).then(()=>{
					this.$router.push({name:'listquestion'});

				}).catch(()=>{
					Swal.fire({
						icon: 'error',
						title: 'Lỗi',
						text: 'Tên tài khoản hoặc mật khẩu không chính xác',
					})
				});


			},
		},
		
	};
</script>

<style scoped>
	 .v-input__control .v-label{
		top: 5px !important;
	}
</style>
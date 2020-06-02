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
            max-height="auto"
            gradient
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
								
								elevation="12"
                                height="auto"
                              
							>
							
								<v-card-text>
									<div class="d-flex justify-content-center ma-5">
										<div>
											<p class="font-weight-bold title text-uppercase" style="color:white">Đăng Ký</p>	
										</div>	
									</div>
									<v-form v-model="formValid">
										<v-text-field     
                                            v-model="fullname"    
                                            :rules="[
												() => !!fullname || 'Tên không được để trống',
												() => fullname.length <= 30 || 'Tên tối đa 30 ký tự'
											]"                   
											color="white"
											label="Họ và tên"
											outlined
											clearable
											prepend-inner-icon="mdi-account"
										/>

                                        <v-text-field 
                                        	v-model="email"    
                                        	:rules="[
												() => !!email || 'Email không được để trống',
												rules.email
											]"                                        
											color="white"
											label="Email"
											outlined
											clearable
											prepend-inner-icon="mdi-email"
										/>

                                        <v-text-field  
                                        	v-model="username"    
                                        	:rules="[
												() => !!username || 'Tên tài khoản không được để trống',
												() => username.length <= 30 || 'Tên tài khoản tối đa 30 ký tự'
											]"                                       
											color="white"
											label="Tên tài khoản"
											outlined
											clearable
											prepend-inner-icon="mdi-account"
										/>

										<v-text-field   
											v-model="password"     
											:rules="[
												() => !!password || 'Mật khẩu không được để trống',
												() => password.length >= 3 || 'Mật khẩu tối thiểu 3 ký tự'
											]"                                     
											color="white"											
											clearable
											outlined
											:append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
											:type="show ? 'text' : 'password'"
											label="Mật khẩu"											
											prepend-inner-icon="mdi-lock"											
											@click:append="show = !show"
										/>

                                        <v-text-field 
                                        	v-model="repassword"  
                                        	:rules="[
												() => !!repassword || 'Nhập lại',
												() => repassword == password || 'Mật khẩu nhập lại chưa khớp'
											]"                                          
											color="white"											
											clearable
											outlined
											:append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
											:type="show2 ? 'text' : 'password'"								
											label="Nhập lại mật khẩu"											
											prepend-inner-icon="mdi-lock"											
											@click:append="show2 = !show2"
										/>

										<div class="d-flex justify-center mt-2">
											<div>
												<VBtn @click="register" :disabled="!formValid" large>Đăng Ký</VBtn>
											</div>
										</div>

                                        <div class="d-flex justify-center mt-2">
											<p class="mt-6">Bạn đã có tài khoản?
											  	<router-link tag="a" :to="{name:'login'}"> Đăng nhập</router-link>
											</p> 
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
	export default{
		data(){
			return{
                show: false,
                show2: false,
                fullname: '',
                email:'',
                username: '',
                password: '',
                repassword: '',
                formValid: true,
                rules: {
			        email: value => {
			            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
			            return pattern.test(value) || 'Email không hợp lệ'
			        },
				},
				
			}
		},
		methods:{
			register()
			{
				axios({
					method: 'post',
					url: 'api/auth/register',
					data:{
						fullname:this.fullname,
						email:this.email,
						username: this.username,
						password: this.password
					}
				}).then(response=>{
					Swal.fire({
						icon: 'success',
						title: 'Thành công',
						text: 'Đăng ký thành công',
					})
				}).catch(error=>{
					Swal.fire({
						icon: 'error',
						title: 'Lỗi',
						text: error.response.data.message,
					})
				})
			}
		}
	};
</script>

<style scoped>
	 .v-input__control .v-label{
		top: 5px !important;
	}
</style>
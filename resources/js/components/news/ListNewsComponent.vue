<template>
	<div>
		<v-img 
			class="bg"
			position="center"
			 gradient="to top, rgb(50, 48, 48), rgba(0, 0, 0, 0.69)"
			src="https://material-portfolio-dark.vuetifyjs.com/img/hero.e530afc6.png">

		</v-img>
		<v-container>
			<v-row>
				<v-col cols='12'>
					<div class="d-flex justify-center text-uppercase mt-12">
						<h2 class="main-header">Tin tức</h2>
					</div>
				</v-col>
				<v-col cols='8' offset="2">
					<v-text-field
						@keyup="search"
						v-model="key"
						solo-inverted
						hide-details
						min-height="40px"
						height="40px"
						label="Nhập tin tức bạn muốn tìm kiếm"
						append-icon="mdi-magnify"
					/>
				</v-col>
			</v-row>
			<v-row class="mt-12">
				<v-col
					v-for="(tintuc,index) in news" 
					:key="index"
					cols='3'
					>
					<v-card
						outlined
						raised
						class="mx-auto"
						:to="'/tin-tuc/'+tintuc.slug"
					>
						<v-img
						:src="tintuc.image"
						height="200px"
						></v-img>

						<v-card-subtitle class='text-truncate ' v-html="tintuc.title">
					
						</v-card-subtitle>

						<v-card-text>
							<v-icon small class="mr-1">mdi-eye</v-icon>
          					<span class="subheading mr-2">{{tintuc.view}}</span>
							
							<v-icon small class="mr-1">mdi-calendar-month</v-icon>
          					<span class="subheading">{{tintuc.time}}</span>
						</v-card-text>
					</v-card>
				</v-col>

				
					<v-pagination
						v-if="showPaginate"
						@input="paginate"
						color="primary"
						class="mt-12"
						v-model="page"
						:length="pagination.last_page"
						:value="page"
						total-visible="10"
					></v-pagination>
				
			</v-row>
		</v-container>
		
	</div>
	
</template>

<script>
	export default{
		data(){
			return{
				news: [],
				pagination: {},
				page: 1,
				key: '',
				showPaginate: true,
			}
		},
		methods: {
			getNews()
			{
				axios.post('api/news/getNews')
				.then(response=>{
					this.news = response.data.data;
					this.pagination = response.data;
				})
			},
			paginate(page){
				axios.post('api/news/getNews?page='+page)
				.then(response=>{
					this.news = response.data.data;
					this.pagination = response.data;
				})
			},
			search()
			{
				axios({
                    method: 'post',
                    url: 'api/news/search',
                    data:{
                        key: this.key
                    }
                })
                .then(response=>{
					if(response.data.length)
					{
						this.showPaginate = false;
						this.news = response.data;
					}
					else
						this.showPaginate = true;
					
                })
			}
		},
		created(){
			this.getNews();

		}
	};
</script>

<style>
	.bottom-gradient {
		background-image: linear-gradient(to top, rgba(0, 0, 0, 0.4) 0%, transparent 172px);
	}

	.repeating-gradient {
		background-image:linear-gradient(45deg, black, transparent);
	}

	.repeating-gradient2 {
		background: linear-gradient(to top, black, #00000061);
		z-index: 1;
	
	}

	.mo {
		height: 100%;
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
	}
	.main-header{
		font-size: 32;
		font-weight: 600;
	}

	.bg {
		position: absolute;
		top: 0;
		left: 0;
	}

</style>
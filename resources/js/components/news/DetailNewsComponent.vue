<template>
    <div>
        <v-container>
            <v-row>
                <v-col cols='8'>
                    <div class="news mt-12" v-html="news">
                
                    </div>
                    <fb-comment :url="'http://startup.com:8888/tin-tuc/'+this.$route.params.slug" />
                </v-col>
                <v-col cols='4'>
                    <v-subheader>Tin liên quan</v-subheader>
                    <div>
                        <v-row>
                            <v-col cols='12' v-for="(news,index) in similarNews" :key="index">
                                <v-card
                                    class="mx-auto"
                                    outlined
                                    :to="'/tin-tuc/'+news.slug"
                                >
                                    <v-list-item three-line>
                                        <v-list-item-avatar
                                            tile
                                            size="50"
                                            color="grey"
                                        >
                                            <v-img :src="news.image"></v-img>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title class="mb-1 text-truncate" v-html="news.title"></v-list-item-title>
                                            <v-list-item-subtitle>
                                                <v-icon small class="mr-1">mdi-eye</v-icon>
                                                <span class="subheading mr-2">{{news.view}}</span>
                                                
                                                <v-icon small class="mr-1">mdi-calendar-month</v-icon>
                                                <span class="subheading">{{news.time}}</span>
                                            </v-list-item-subtitle>
                                        </v-list-item-content>
                                    </v-list-item>
                                </v-card>
                            </v-col>
                        </v-row>
                    </div>
                </v-col>
            </v-row>
            
        </v-container>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                news: '',
                similarNews: []
            }
        },
        methods:{
            getNewsBySlug()
            {
                axios({
                    method: 'post',
                    url: 'api/news/getNewsBySlug',
                    data:{
                        slug: this.$route.params.slug
                    }
                })
                .then(response=>{
                    this.news = response.data;
                    Vue.nextTick(function () {
                        jQuery(document).ready(function($) {
                            $('.entry-footer').remove();
                            $('.single-widget').remove();
                        });
                    })
        
                })
                .catch(error=>{
                    if(error.response)
                        this.$router.push({name:"404"});
                });
            },
            getSimilarNews()
            {
                axios({
                    method: 'post',
                    url: 'api/news/getSimilarNews',
                    data:{
                        slug: this.$route.params.slug
                    }
                })
                .then(response=>{
                    this.similarNews = response.data;
                })
                .catch(error=>{
                    
                });
            }
        },
         watch: {
            '$route.params.slug' : function () {
                this.getNewsBySlug();
                //this.getSimilarNews();
            }
        },
        created(){
            this.getNewsBySlug();
            this.getSimilarNews();
        }

    };
</script>

<style >
    .news img{
        width: 100%;
        height: 100%;
        margin-bottom: 20px;
    }
</style>
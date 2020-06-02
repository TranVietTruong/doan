<template>
    <div>
        <v-row>
            <v-col cols='12'>
                <v-card
                    v-if="question"
                    class="mb-5"
                    max-width="100%"
                    outlined
                    
                >
                    <v-list-item>
                        <v-list-item-avatar dense size="30" :color="question.avatar ? '':'primary'">
                            <img v-if="question.avatar"  :src="question.avatar">
                            <span v-if="!question.avatar" class="white--text subtitle-2">
                                {{question.full_name.substr(0,2)}}
                            </span>
                        </v-list-item-avatar>

                        <v-list-item-content>
                            <v-list-item-title class="font-weight-bold subtitle-2">{{question.full_name}}</v-list-item-title>
                            <v-list-item-subtitle class="font-weight-thin caption">{{question.time}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    
                    <v-list-item three-line>
                        <v-list-item-content>
                            <v-list-item-title class=".subtitle-2 mb-3 text-wrap">
                                {{question.content}}
                            </v-list-item-title>

                            <v-list-item-subtitle>
                                <v-chip
                                    v-for="item in question.tag"
                                    class="ma-1"
                                    color="grey darken-1"
                                    label
                                    text-color="white"
                                    small
                                    
                                >
                                    <v-icon small left>mdi-tag</v-icon>
                                    {{item.text}}
                                </v-chip>
                            </v-list-item-subtitle>

                        
                        </v-list-item-content>
                    </v-list-item>
                
                    <v-card-actions>
                        <VTooltip top color="primary">
                            <template v-slot:activator="{on}">
                                <v-btn
                                    @click="likeQuestion(question)"
                                    :color="question.liked ? 'primary':''"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                <VIcon small left>mdi-thumb-up </VIcon>{{question.num_like}}
                                </v-btn>
                            </template>
                            <span> Like </span>
                        </VToolTip>  

                        <VTooltip top color="primary">
                            <template v-slot:activator="{on}">      
                                <v-btn
                                    @click="dislikeQuestion(question)"
                                    :color="question.disliked ? 'primary':''"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                    {{question.num_dislike}}
                                    <VIcon small right>mdi-thumb-down </VIcon>
                                </v-btn>
                            </template>
                            <span> Dislike </span>
                        </VToolTip>

                        <VTooltip top color="pink">
                            <template v-slot:activator="{on}">     
                                <v-btn
                                    @click="favorite(question)"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                    <VIcon
                                        :color="question.favorited ? 'pink':''"
                                        small>mdi-cards-heart</VIcon></v-btn>
                            </template>
                            <span>Yêu thích</span>
                        </VToolTip>        
                    </v-card-actions>
                    

                    <v-divider></v-divider>
                    <div class="d-flex justify-space-between mt-3">
                        <p class="subtitle-2 mt-3 ml-3">{{question.num_answer}} câu trả lời</p>

                        <div style="max-width:200px" class="mt-1">
                            <v-select
                            @change="sortAnswer"
                            v-model="type"
                            :items="items"
                            dense
                            label="Tùy chọn"
                            outlined
                            ></v-select>
                        </div>
                    </div>
                    <v-divider></v-divider>
                    <div class="answer mb-2" v-for="answer in question.answers">
                        <v-list-item>
                            <v-list-item-avatar dense size="30" :color="answer.avatar ? '':'primary'">
                                <img v-if="answer.avatar"  :src="answer.avatar">
                                <span v-if="!answer.avatar" class="white--text subtitle-2">
                                    {{answer.full_name.substr(0,2)}}
                                </span>
                            </v-list-item-avatar>

                            <v-list-item-content>
                                <v-list-item-title class="font-weight-bold subtitle-2">{{answer.full_name}}</v-list-item-title>
                                <v-list-item-subtitle class="font-weight-thin caption">{{answer.time}}</v-list-item-subtitle>
                            </v-list-item-content>
                        </v-list-item>
                        
                        <div class="ma-5" v-html="answer.content">
                            
                        </div>
                    
                        <v-card-actions>
                            <VTooltip top color="primary">
                                <template v-slot:activator="{on}">
                                    <v-btn 
                                        @click="likeAnswer(answer)"
                                        :color="answer.liked ? 'primary':''"
                                        small 
                                        v-on="on" 
                                        class="mr-2 ml-2"> 
                                        <VIcon small left>mdi-thumb-up </VIcon>{{answer.num_like}}</v-btn>
                                </template>
                                <span> Like </span>
                            </VToolTip>  

                            <VTooltip top color="primary">
                                <template v-slot:activator="{on}">      
                                    <v-btn 
                                        @click="dislikeAnswer(answer)"
                                        :color="answer.disliked ? 'primary':''"
                                        small 
                                        v-on="on" 
                                        class="mr-2">{{answer.num_dislike}} 
                                        <VIcon small right>mdi-thumb-down </VIcon></v-btn>
                                </template>
                                <span> Dislike </span>
                            </VToolTip>

                           
                        </v-card-actions>
                        <v-divider></v-divider>
                    </div>
                    
                    <div class="d-flex justify-start ma-5">
                        <p class=".font-weight-bold	subtitle-2">Câu trả lời của bạn</p>
                    </div>
                    <div class="ma-5 mt-2">
                        
                        <vue-editor ref="Editor" v-model="content" />
                        <div class="d-flex justify-end">
                            <v-btn @click="answer" class="mt-2">Trả lời</v-btn>
                        </div>
                    </div>
                </v-card>
            </v-col>
        </v-row>      
    </div>
</template>

<script>
export default {
    data(){
        return{
            question: null,
            type: '',
            items: [
                {text:'Cũ nhất',value:1},
                {text:'Mới nhất',value:2},
                {text:'Bình chọn',value:3},
            ],
            content: null
        }
    },
    methods:{
        getDetailQuestion()
        {
            axios({
                method: 'post',
                url: 'api/question/getQuestionBySlug',
                data:{
                    slug: this.$route.params.slug
                }
            })
            .then(response=>{

                this.question = response.data;
                this.question.tag = JSON.parse(this.question.tag);
                this.question.answers = JSON.parse(this.question.answers);
            })
            .catch(error=>{
                if(error.response)
                    this.$router.push({name:"404"});
            });
        },

        //===================================================================================
        likeQuestion(question)
        {
            let action;
            if(question.liked)
            {
                action = 'unlike';
                question.num_like -= 1;
                question.liked = false;
            }
            else
            {
                action = 'like';
                question.num_like += 1;
                question.liked = true;
                if(question.disliked)
                {
                    question.disliked = false;
                    question.num_dislike -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/question/likeQuestion',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });

        },
        dislikeQuestion(question)
        {
            let action;
            if(question.disliked)
            {
                action = 'undislike';
                question.num_dislike -= 1;
                question.disliked = false;
            }
            else
            {
                action = 'dislike';
                question.num_dislike += 1;
                question.disliked = true;
                if(question.liked)
                {
                    question.liked = false;
                    question.num_like -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/question/dislikeQuestion',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });
        },
        favorite(question)
        {
            let action;
            if(question.favorited)
            {
                action = 'unfavorite';
                question.favorited = false;
            }
            else
            {
                action = 'favorite';
                question.favorited = true;
            }

            axios({
                method: 'post',
                url: 'api/question/favorite',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });
        },
        //================================================================================================


        answer()
        {
            axios({
                method: 'post',
                url: 'api/answer/postAnswer',
                data:{
                    id_question: this.question.id,
                    content: this.content,
                    content_text: this.$refs.Editor.quill.getText()
                }
            })
            .then(response=>{
                this.question.num_answer += 1;
                this.question.answers.push(response.data);
            });
        },

        likeAnswer(answer)
        {
            let action;
            if(answer.liked)
            {
                action = 'unlike';
                answer.num_like -= 1;
                answer.liked = false;
            }
            else
            {
                action = 'like';
                answer.num_like += 1;
                answer.liked = true;
                if(answer.disliked)
                {
                    answer.disliked = false;
                    answer.num_dislike -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/answer/likeAnswer',
                data:{
                    action: action,
                    id_answer: answer.id,
                }
            });
        },
        dislikeAnswer(answer)
        {
            let action;
            if(answer.disliked)
            {
                action = 'undislike';
                answer.num_dislike -= 1;
                answer.disliked = false;
            }
            else
            {
                action = 'dislike';
                answer.num_dislike += 1;
                answer.disliked = true;
                if(answer.liked)
                {
                    answer.liked = false;
                    answer.num_like -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/answer/dislikeAnswer',
                data:{
                    action: action,
                    id_answer: answer.id,
                }
            });
        },
        sortAnswer()
        {
            console.log(this.type);
            switch (this.type) 
            {
                case 1:
                    this.question.answers.sort((a,b)=>{
                        if(Date.parse(a.created_at) > Date.parse(b.created_at))
                            return 1;
                        return -1;
                    });
                    break;
                case 2:
                    this.question.answers.sort((a,b)=>{
                        if(Date.parse(a.created_at) < Date.parse(b.created_at))
                            return 1;
                        return -1;
                    });
                    break;
                case 3:
                    this.question.answers.sort((a,b)=>{
                        if(a.num_like < b.num_like)
                            return 1;
                        return -1;
                    });
                    break;
                default:
                    break;
            }
        }
    },
    watch: {
        '$route.params.slug' : function () {
           this.getDetailQuestion();
        }
    },
    created()
    {
        this.getDetailQuestion();
    }
};
</script>

<style>
    @import "~vue2-editor/dist/vue2-editor.css";


</style>
<template>
    <div>
        <VNavigationDrawer mini-variant app class='my-nav'>
            <VList>
                <VTooltip right color="#000">
                    <template v-slot:activator="{on }">
                        <VListItem v-on="on"> 
                            <VBtn 
                                :to="'/dien-dan'"
                                active-class="active"
                                medium  
                                class='mb-2'>
                                <VIcon>mdi-forum</VIcon>
                            </VBtn>

                        </VListItem>
                    </template>
                    <span>Diễn đàn</span>
                </VTooltip>
                
                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn 
                                :to="'/tin-tuc'"
                                active-class="active"
                                medium  
                                exact
                                class="mb-2">
                                <VIcon>mdi-television-classic</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Tin tức</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn
                                :to="'/tu-van'"
                                active-class="active" 
                                medium 
                                link 
                                class="mb-2" >
                                <VIcon>mdi-book-open-page-variant</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Pháp luật</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn medium link class="mb-2" >
                                <VIcon>mdi-contact-mail</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Liên hệ</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn medium link class="mb-2" >
                                <VIcon>mdi-settings</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Cài đặt</span>
                </VTooltip> 
            </VList>
        </VNavigationDrawer>

        <v-content>
            <v-img 
                height="110vh"
                class="bg"
                position="center"
                gradient="to top, rgb(50, 48, 48), rgba(0, 0, 0, 0.69)"
                src="https://material-portfolio-dark.vuetifyjs.com/img/hero.e530afc6.png">

        
            <v-container >
                <div class="d-flex justify-center">
                    <v-avatar
                        tile
                        size="100">
                        <img
                            src="https://cdn.sstatic.net/Img/home/ask-a-question.svg"
                            alt="John"
                        >
                    </v-avatar>
                </div>
                <v-row> 
                    <v-col cols='10' offset="1">
                        <v-divider class="pb-5"></v-divider>
                        <div class="chat pr-2" id="chat">
                            <div 
                                v-for="(m,index) in message"
                                :key="index"
                                :class="m.type ? 'message d-flex justify-end':'message d-flex justify-start'">
                                <VAlert 
                                    v-html="m.content"
                                    elevation='2'
                                    :icon="m.type ? 'mdi-account':'mdi-robot'"
                                    text
                                    :color="m.type ? 'primary':'white'" 
                                    dense 
                                    max-width="49%">
<!--                                    {{m.content}}-->
                                </VAlert>
                            </div>
                        </div>
                        
                        


                        <div class="input-question ma-3">
                            <v-form v-model="formValid" v-on:submit.prevent="askQuestion">
                                <v-text-field
                                    v-model="question"
                                    :rules="[
                                        () => !!question || 'Nhập nội dung câu hỏi',
                                    ]"
                                    color="white"
                                    dark=""
                                    dense=""
                                    outlined=""
                                    append-icon="mdi-send"
                                ></v-text-field> 
                            </v-form>
                        </div>

<!--                        <div class="ma-5 mt-2">-->

<!--                            <vue-editor ref="Editor" v-model="content" />-->
<!--                            <div class="d-flex justify-end">-->
<!--                                <v-btn @click="insertAnswer" class="mt-2">Trả lời</v-btn>-->
<!--                            </div>-->
<!--                        </div>-->
                    </v-col>
                </v-row>
            </v-container>
            </v-img>
        </v-content> 
    </div>
</template>

<script>
export default {
    data(){
        return {
            message: [],
            question:'',
            formValid: true,
            content: ''
        }
    },
    methods:{
        sayHello()
        {
            const vm = this;
            setTimeout(function(){
                vm.message.push({
                    type:0,
                    content: 'Xin chào bạn, hãy đặt câu hỏi'
                });
            },1000);
        },
        askQuestion()
        {

            if(this.formValid)
            {
                $("#chat").animate({ scrollTop: $('#chat')[0].scrollHeight }, 1000);

                this.message.push({
                    type: 1,
                    content: this.question
                });

                axios({
                    method: 'post',
                    url: 'api/qa/askQuestion',
                    data:{
                        question: this.question
                    }
                })
                .then(response=>{
                    this.message.push({
                        type: 0,
                        content: response.data.answer
                    });
                    this.question = ' ';
                    $("#chat").animate({ scrollTop: $('#chat')[0].scrollHeight }, 1000);

                });
            }
        },
        insertAnswer()
        {
            axios({
                method: 'post',
                url: 'api/answer/insertAnswer',
                data:{
                    text_html: this.content,
                    text: this.$refs.Editor.quill.getText()
                }
            })
            .then(response=>{
                //alert('ok');
            });
        }
    },
    created()
    {
        this.sayHello();
    }
}
</script>

<style>
    /* .input-question{
        position: absolute;
        top: 80%;
        width: 100%;
        left: 0;
    } */

    .chat{
        width: 100%;
        height: 600px;
        max-height: 600px;
        overflow-y: scroll;
    }

    .chat::-webkit-scrollbar-track
    {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        border-radius: 5px;
        background-color: #F5F5F5;
    }

    .chat::-webkit-scrollbar
    {
        width: 0px;
        background-color: #F5F5F5;
    }

    .chat::-webkit-scrollbar-thumb
    {
        border-radius: 5px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #555;
    }

    .message{
        width: 100%;
        display: block;
    }
</style>

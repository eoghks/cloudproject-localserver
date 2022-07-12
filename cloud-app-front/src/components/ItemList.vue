<template>
  <div>
      <ul>
        <li v-for="(item,index) in this.itemList" :key=item.itemName class="shadow">
            <span class="simpleImageBox">
              <img :src="require(`@/assets/images/${item.itemName}.jpg`)" class="simpleImage" />
            </span>
            <h3 class="contentTitle">
                {{item.itemName}}
            </h3>
            <div class="playBtn">
              <font-awesome-icon :icon="['fas','play']"  @click="postData(item.itemName,item.count,index)"/>
            </div>
        </li>
      </ul>
  </div>
</template>

<script>
import axios from 'axios';
export default {

    data() {
        return{
            itemList:[],
            userList:[{uid:"jhon",sex:"남",age:15},
            {uid:"diana",sex:"여",age:24},
            {uid:"ryze",sex:"남",age:43},
            {uid:"aaron",sex:"남",age:50},
            {uid:"hailee",sex:"여",age:39},
            {uid:"eddie",sex:"남",age:52},],
            userOne:'',
        }
    },
    methods:{
      //서버에서 데이터 수신 getData()
      getData() {
        // cloud 서버
        //axios.get("http://43.200.25.214:3000/getItem/")
        // 로컬 서버
        axios.get("http://localhost:3000/getItem/")
        .then((res) => {
          console.log(res.data);
          this.itemList=res.data
        })
        .catch(error =>{
          console.log(error);
        })
        .finally(()=>{
          this.listSort()
        })
        console.log(process.env)
   
      },

      //버튼 크릭시 유저데이터 송신 (데이터 폼)
      postData(name,count,index) {
        let postConfig = {
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          },
          responseType: 'blob',
        } 
        // 클라우드 서버
        // axios.post('http://43.200.25.214:3000/get', { itemName: name, user: this.userOne }, postConfig )
        // 로컬 서버
        axios.post('http://localhost:3000/get', { itemName: name, user: this.userOne }, postConfig)
          .then((res) => {

            var fileURL = window.URL.createObjectURL(new Blob([res.data], { type: "application/pdf" }));
            console.log(fileURL);
            var fileLink = document.createElement('a');
            fileLink.href = fileURL;
            fileLink.setAttribute('download', 'file.pdf');
            document.body.appendChild(fileLink);
            fileLink.click();
          })
          .catch(error => {
            console.log(error);
          })

        this.itemList[index].count += 1
        
        //리스트 count에 따른 정렬
        this.listSort()
      },


      //리스트 정렬 내림차순
      listSort() {
        this.itemList.sort(function (a,b) {
          if(a.count>b.count){
            return -1;
          }
          if(a.count<b.count){
            return 1;
          }
          return 0;
        })
      }

      
    },
      created() {
      //서버 연결 코드 부분
      this.getData();
      this.userOne=this.userList[Math.floor(Math.random()*6)]

    },
}
</script>

<style scoped>
ul {
  list-style-type: none;
  padding-left: 0px;
  margin-top: 0;
  text-align: left;
}
li {
  display: flex;
  min-height: 125px;
  height: 125px;
  line-height: 125px;
  margin: 0.5rem 0;
  padding: 0 0.9rem;
  background: white;
  border-radius: 20px;
}
.simpleImageBox{
  /* line-height: 125px; */
  display: flex;
  width: 80px;
  height: 100px;
  line-height: 100px;
  margin-top:0.7rem;
  margin-right:0.9rem;

}
.simpleImage{
  object-fit: cover;
  height: 100%;
  width: 100%;

}
.playBtn{
  display: flex;
  margin-left: auto;
  margin-right: 0;
  margin-top:2.5rem;
  border: 0;
  outline: 0;
  padding:0.5rem,0;
  transition: all 0.2s;
  color: #778899;
  font-size:45px;
}
.playBtn:link {
  color: #778899;
}
.playBtn:hover{
  color: black;
}
.playBtn:visited{
  text-decoration: none;
}
.contentTitle{
  font-weight:20px;
  margin:0;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

</style>
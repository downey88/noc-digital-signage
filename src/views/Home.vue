<template>
  <div class="flex font-body h-full p-4 text-secondary">
    <div class="w-full">
      <div class="flex flex-col h-full">
        <div class="flex flex-grow x-h-full overflow-hidden">
          <div class="overflow-hidden p-2 w-1/2">
            <div
              class="bg-white border-2 border-secondary flex flex-col h-full overflow-hidden rounded-md shadow-md"
            >
              <div class="flex flex-row mb-5 p-4 shadow-md">
                <i class="fas fa-laptop-medical self-center text-4xl w-1/3"></i>
                <h2 class="self-center text-2xl text-center w-full">Tugas</h2>
                <div class="w-1/3">
                  <div
                    v-if="tasks.length > 0"
                    :class="{
                      'animate__animated animate__flash animate__infinite animate__slower':
                        tasks.length > 10
                    }"
                    class="bg-secondary h-11 ml-auto p-1.5 text-2xl text-center text-white rounded-full w-11"
                  >
                    {{ tasks.length }}
                  </div>
                </div>
              </div>
              <div
                v-if="tasks.length > 0"
                class="flex-grow h-full overflow-hidden"
              >
                <div v-for="item in tasks" :key="item.id" class="pb-3 px-4">
                  <div class="flex flex-row">
                    <div class="flex w-1/3">
                      <div
                        :class="{
                          'animate__animated animate__flash animate__infinite animate__slower bg-red-600':
                            item.is_delayed,
                          'bg-green-600': !item.is_delayed
                        }"
                        class="h-5 mr-2 rounded-full w-5 mt-1.5"
                      ></div>
                      <div class="font-bold text-2xl">{{ item.name }}</div>
                      <i
                        v-if="item.priority > 2"
                        class="fas fa-exclamation-circle animate__animated animate__flash animate__infinite animate__slower text-xl pl-2 pt-0.5"
                      ></i>
                      <div v-if="item.priority > 3" class="">
                        <i
                          class="fas fa-exclamation-circle animate__animated animate__flash animate__infinite animate__slower text-xl pl-1 pt-0.5 inline-block"
                        ></i>
                      </div>
                    </div>
                    <div class="capitalize flex text-left w-1/3">
                      <!-- <div
                        :class="{
                          'bg-red-600': item.is_delayed,
                          'bg-green-600': !item.is_delayed
                        }"
                        class="font-bold ml-auto px-3 py-0.5 rounded-md text-center text-md text-white w-3/4"
                      > -->

                      <div
                        :class="{
                          'animate__animated animate__flash animate__infinite animate__slower ':
                            item.is_delayed
                        }"
                        class="text-center text-xl w-full"
                      >
                        {{ item.date }}
                      </div>
                      <!-- </div> -->
                    </div>
                    <div class="w-1/3">
                      <div
                        :class="{
                          'bg-red-600': item.status != 0,
                          'bg-yellow-400': item.status == 0
                        }"
                        class="font-bold ml-auto px-3 py-0.5 rounded-md text-center text-md text-white w-3/4"
                      >
                        {{
                          item.status == "0"
                            ? "Belum Selesai"
                            : "Belum Diperiksa"
                        }}
                      </div>
                    </div>
                  </div>
                  <div
                    class="border-b border-tertiary line-clamp-2 pb-4 pt-2 text-xl"
                  >
                    {{ item.description }}
                  </div>
                </div>
              </div>
              <div v-else class="flex flex-grow py-5">
                <div class="m-auto w-4/5">
                  <img
                    class="h-full w-full"
                    src="@/assets/images/undraw_blank_canvas_re_2hwy.svg"
                  />
                  <div class="p-2 text-2xl text-center">
                    <i class="far fa-thumbs-up"></i> Luar Biasa! Tidak Ada
                    Tugas.
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="overflow-hidden p-2 w-1/2">
            <div
              class="bg-white border-2 border-secondary flex flex-col h-full overflow-hidden rounded-md shadow-md"
            >
              <div class="flex flex-row mb-5 p-4 shadow-md">
                <i class="fas fa-walking self-center text-4xl w-1/3"></i>
                <h2 class="self-center text-2xl text-center w-full">
                  Tugas Lapangan
                </h2>
                <div class="w-1/3">
                  <div
                    v-if="field_tasks.length > 0"
                    :class="{
                      'animate__animated animate__flash animate__infinite animate__slower':
                        field_tasks.length > 10
                    }"
                    class="bg-secondary h-11 ml-auto p-1.5 text-2xl text-center text-white rounded-full w-11"
                  >
                    {{ field_tasks.length }}
                  </div>
                </div>
              </div>
              <div
                v-if="field_tasks.length > 0"
                class="flex-grow h-full x-overflow-scroll"
              >
                <div
                  v-for="item in field_tasks"
                  :key="item.id"
                  class="pb-3 px-4"
                >
                  <div class="flex flex-row">
                    <div class="flex w-2/4">
                      <div class="font-bold text-2xl">{{ item.name }}</div>
                      <i
                        v-if="item.priority > 2"
                        class="fas fa-exclamation-circle animate__animated animate__flash animate__infinite animate__slower text-xl pl-2 pt-0.5"
                      ></i>
                      <div v-if="item.priority > 3" class="">
                        <i
                          class="fas fa-exclamation-circle animate__animated animate__flash animate__infinite animate__slower text-xl pl-1 pt-0.5 inline-block"
                        ></i>
                      </div>
                    </div>
                    <div class="capitalize text-center w-1/4">
                      <div
                        :class="{
                          'bg-red-600': item.is_delayed,
                          'bg-green-600': !item.is_delayed
                        }"
                        class="font-bold mx-auto px-3 py-0.5 rounded-md text-center text-md text-white w-4/5"
                      >
                        {{ item.date }}
                      </div>
                    </div>
                    <div class="w-1/4">
                      <div
                        :class="{
                          'bg-red-600': item.status != 0,
                          'bg-yellow-400': item.status == 0
                        }"
                        class="font-bold ml-auto px-3 py-0.5 rounded-md text-center text-md text-white w-full"
                      >
                        {{
                          item.status == "0"
                            ? "Belum Selesai"
                            : "Belum Diperiksa"
                        }}
                      </div>
                    </div>
                  </div>
                  <div
                    class="border-b border-tertiary line-clamp-2 pb-4 pt-2 text-xl"
                  >
                    {{ item.description }}
                  </div>
                </div>
              </div>
              <div v-else class="flex flex-grow py-5">
                <div class="m-auto w-4/5">
                  <img
                    class="h-full w-full"
                    src="@/assets/images/undraw_blank_canvas_re_2hwy.svg"
                  />
                  <div class="p-2 text-2xl text-center">
                    <i class="far fa-thumbs-up"></i> Luar Biasa! Tidak Ada Tugas
                    Lapangan.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="flex-grow-0 flex-shrink-0 p-2">
          <div
            class="bg-white border-2 border-secondary h-full p-5 rounded-md shadow-md"
          >
            <div class="flex flex-row justify-between">
              <div>
                <div class="text-left">
                  <div class="font-bold self-center text-4xl">
                    {{ clockHH }}:{{ clockMM
                    }}<!-- :{{ clockSS }} -->
                  </div>
                  <div class="self-center text-3xl">
                    {{ dateDayName }}, {{ dateDay }} {{ dateMonth }}
                    <!-- {{ dateYear }} -->
                  </div>
                </div>
              </div>
              <div class="">
                <div class="font-bold self-center text-4xl text-center">
                  Total Tugas
                </div>
                <div class="self-center text-3xl text-center capitalize">
                  {{ tasks_count }}
                </div>
              </div>
              <div class="">
                <div class="font-bold self-center text-4xl text-center">
                  Total Tugas Lapangan
                </div>
                <div class="self-center text-3xl text-center capitalize">
                  {{ field_tasks_count }}
                </div>
              </div>
              <div class="">
                <div class="font-bold self-center text-4xl text-right">
                  {{ weatherTemp }}&#8451;
                </div>
                <div class="self-center text-3xl text-right capitalize">
                  <img :src="weatherIcon" class="inline-block h-8" />
                  {{ weatherStatus }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex-none p-2 w-1/4">
      <div
        class="bg-white border-2 border-secondary h-full overflow-hidden rounded-md shadow-md"
      >
        <div class="flex flex-row mb-5 p-4 shadow-md">
          <i class="fas fa-users text-4xl self-center w-1/3"></i>
          <h2 class="col-span-5 self-center text-2xl text-center w-full">
            Tim Layanan
          </h2>
          <div class="w-1/3">
            <div
              v-if="users.length > 0"
              class="bg-secondary h-11 ml-auto p-1.5 text-2xl text-center text-white rounded-full w-11"
            >
              {{ users.length }}
            </div>
          </div>
        </div>
        <div class="flex flex-col">
          <div v-for="user in users" :key="user.uid" class="pb-3 px-4">
            <div class="border-b border-tertiary flex pb-4">
              <div class="relative w-1/4">
                <img
                  v-if="user.picture != ''"
                  :x-class="userPresenceStatus(user)"
                  :src="user.picture"
                  class="border border-tertiary p-1 rounded-full w-full"
                />
                <img
                  v-else
                  src="@/assets/images/no-profile-pic.jpg"
                  class="border border-tertiary p-1 rounded-full w-full"
                />

                <div
                  :class="userStatusBadge(user)"
                  class="absolute border-4 border-white bottom-0 font-bold h-10 right-0 p-0.5 rounded-full text-center text-lg text-white w-10"
                >
                  {{ userStatusBadgeCount(user) }}
                </div>
              </div>
              <div class="flex flex-col justify-center pl-3 w-3/4">
                <div class="font-bold line-clamp-1 text-2xl">
                  {{ user.name }}
                </div>
                <div
                  v-for="(status, key) in user.status"
                  :key="status.text"
                  class="line-clamp-2 text-xl"
                >
                  <div
                    v-if="user.current_status == key"
                    class="animate__animated animate__slideInUp"
                  >
                    <span
                      v-if="userStatusBadgeCount(user) > 1"
                      :class="{
                        'bg-secondary': !status.is_overdue,
                        'bg-red-600': status.is_overdue
                      }"
                      class="px-2 py-0.5 rounded-md text-sm text-white"
                      >{{ key + 1 }} / {{ userStatusBadgeCount(user) }}</span
                    >
                    &nbsp;{{ status.text }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
import axios from "axios";

export default {
  name: "Home",
  components: {
    // HelloWorld,
  },
  data: function () {
    return {
      tasks: [
        {
          name: "Bapak Surya",
          description: "Tidak bisa internet",
          date: "05/05/2022"
        },
        {
          name: "Ibu Maria",
          description: "Tidak bisa cetak dokumen",
          date: "05/05/2022"
        }
      ],
      tasks_count: 0,
      field_tasks: [],
      field_tasks_count: 0,
      users: [
        {
          uid: 31,
          name: "Inanta Martsanto",
          status: "Pengerjaan Digital Signage",
          status_type: "0",
          presence_out: null
        },
        {
          uid: 144,
          name: "Donny Trijatmiko",
          status:
            "Konfigurasi cPanel dan server untuk deployment CI/CD aplikasi digital signage",
          status_type: 1,
          presence_out: null
        },
        {
          uid: 139,
          name: "Sherly Sanjaya",
          status_type: 1,
          presence_out: 1
        }
      ],
      dayNames: [
        "Minggu",
        "Senin",
        "Selasa",
        "Rabu",
        "Kamis",
        "Jumat",
        "Sabtu"
      ],
      monthNames: [
        "Januari",
        "Februari",
        "Maret",
        "April",
        "Mei",
        "Juni",
        "Juli",
        "Agustus",
        "September",
        "Oktober",
        "November",
        "Desember"
      ],
      dateDayName: "Minggu",
      dateDay: 1,
      dateMonth: "Januari",
      dateYear: 2000,
      clockHH: 0,
      clockMM: 0,
      clockSS: 0,
      weatherStatus: "",
      weatherTemp: 26,
      weatherIconCode: "01d",
      hash: ""
    };
  },
  mounted: function () {
    let self = this;

    self.fetchData();
    self.cycleStatus();
    self.getWeather();

    setInterval(function () {
      self.fetchData();
    }, 3000);

    setInterval(function () {
      self.getClock();
    }, 1000);

    setInterval(function () {
      self.getWeather();
    }, 7200000);
  },
  computed: {
    weatherIcon: function () {
      return (
        "http://openweathermap.org/img/wn/" + this.weatherIconCode + "@2x.png"
      );
    }
  },
  methods: {
    userProfilePicture: function (user) {
      axios({
        method: "get",
        url:
          "http://noc.maranatha.edu/staff/apps/ihollo/images/profile/" +
          user.uid +
          ".jpg"
      })
        .then(function () {
          user.picture =
            "http://noc.maranatha.edu/staff/apps/ihollo/images/profile/" +
            user.uid +
            ".jpg";
        })
        .catch(function () {
          user.picture = "";
        });
    },
    userStatusBadge: function (user) {
      return user.presence_out != null
        ? "bg-tertiary"
        : user.status.length == 0 // user.status_type == 0
        ? "bg-green-600"
        : "bg-red-600";
    },
    userStatusBadgeCount: function (user) {
      if (
        typeof user.status !== "undefined" &&
        typeof user.status.length !== "undefined"
      ) {
        return user.status.length;
      }

      return "";
    },
    userPresenceStatus: function (user) {
      return user.presence_out == null ? "border-green-600" : "border-tertiary";
    },
    fetchData: function () {
      let self = this;

      axios({
        method: "get",
        url: "http://noc.maranatha.edu/ds-service/",
        responseType: "stream"
      }).then(function (response) {
        // console.log(response);

        if (self.hash != response.data.hash) {
          self.hash = response.data.hash;
          self.tasks_count = response.data.tasks_count;
          self.field_tasks_count = response.data.field_tasks_count;

          self.field_tasks.splice(0);

          for (
            let index = 0;
            index < response.data.field_tasks.length;
            index++
          ) {
            const task = response.data.field_tasks[index];

            self.field_tasks.push(task);
          }

          self.tasks.splice(0);

          for (let index = 0; index < response.data.tasks.length; index++) {
            const task = response.data.tasks[index];

            self.tasks.push(task);
          }

          self.users.splice(0);

          for (let index = 0; index < response.data.presences.length; index++) {
            // response.data.presences[index]["visible_status"] = 0;
            const presence = response.data.presences[index];
            presence["current_status"] = 0;
            // presence["picture"] = "";

            // self.userProfilePicture(presence);

            console.log(presence);

            self.users.push(presence);
          }
        }

        // console.log(response.data.tasks);
      });
    },
    cycleStatus: function () {
      let self = this;

      setInterval(function () {
        for (let index = 0; index < self.users.length; index++) {
          const current_user = self.users[index];

          if (current_user.status.length <= 1) {
            continue;
          }

          if (current_user.current_status + 1 >= current_user.status.length) {
            current_user.current_status = 0;
          } else {
            current_user.current_status++;
          }
        }
      }, 5000);
    },
    getClock: function () {
      let date = new Date();

      let hh = date.getHours();
      let mm = date.getMinutes();
      let ss = date.getSeconds();

      this.dateDayName = this.dayNames[date.getDay()];
      this.dateDay = date.getDate();
      this.dateMonth = this.monthNames[date.getMonth()];
      this.dateYear = date.getFullYear();
      this.clockHH = hh < 10 ? "0" + hh : hh;
      this.clockMM = mm < 10 ? "0" + mm : mm;
      this.clockSS = ss < 10 ? "0" + ss : ss;
    },
    getWeather: function () {
      let self = this;
      axios({
        method: "get",
        url: "https://api.openweathermap.org/data/2.5/weather?lat=-6.8861&lon=107.581&lang=id&units=metric&appid=59ce474bf023e834ca54e5966dbaae0e",
        responseType: "stream"
      }).then(function (response) {
        self.weatherIconCode = response.data.weather[0].icon;
        self.weatherStatus = response.data.weather[0].description;
        self.weatherTemp = Math.round(response.data.main.feels_like);
        // console.log(response.data);
      });
    }
  }
};
</script>

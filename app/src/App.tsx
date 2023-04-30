import { Redirect, Route } from "react-router-dom";
import {
  IonApp,
  IonIcon,
  IonLabel,
  IonRouterOutlet,
  IonTabBar,
  IonTabButton,
  IonTabs,
  setupIonicReact,
} from "@ionic/react";
import { listCircleOutline, peopleOutline } from "ionicons/icons";
import { IonReactRouter } from "@ionic/react-router";
import TaskPage from "./pages/TaskPage";
import FriendPage from "./pages/FriendPage";

/* Core CSS required for Ionic components to work properly */
import "@ionic/react/css/core.css";

/* Basic CSS for apps built with Ionic */
import "@ionic/react/css/normalize.css";
import "@ionic/react/css/structure.css";
import "@ionic/react/css/typography.css";

/* Optional CSS utils that can be commented out */
import "@ionic/react/css/padding.css";
import "@ionic/react/css/float-elements.css";
import "@ionic/react/css/text-alignment.css";
import "@ionic/react/css/text-transformation.css";
import "@ionic/react/css/flex-utils.css";
import "@ionic/react/css/display.css";

/* Theme variables */
import "./theme/variables.css";

setupIonicReact();

const App: React.FC = () => (
  <IonApp>
    <IonReactRouter>
      <IonTabs>
        <IonRouterOutlet>
          <Route exact path="/task">
            <TaskPage />
          </Route>
          <Route exact path="/friend">
            <FriendPage />
          </Route>
          <Route exact path="/">
            <Redirect to="/task" />
          </Route>
        </IonRouterOutlet>
        <IonTabBar slot="bottom">
          <IonTabButton tab="task" href="/task">
            <IonIcon aria-hidden="true" icon={listCircleOutline} />
            <IonLabel>Task</IonLabel>
          </IonTabButton>
          <IonTabButton tab="friend" href="/friend">
            <IonIcon aria-hidden="true" icon={peopleOutline} />
            <IonLabel>Friend</IonLabel>
          </IonTabButton>
        </IonTabBar>
      </IonTabs>
    </IonReactRouter>
  </IonApp>
);

export default App;

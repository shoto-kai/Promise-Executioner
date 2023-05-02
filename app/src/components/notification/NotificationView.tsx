import { FC } from "react";
import NotificationList from "~/components/notification/NotificationList";
import { Notification } from "~/models/notification/notification";

interface Props {
  notifications: readonly Notification[];
}

const NotificationView: FC<Props> = ({ notifications }) => {
  return <NotificationList notifications={notifications} />;
};

export default NotificationView;

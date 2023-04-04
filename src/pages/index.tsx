import HelloName from '../components/HelloName';
import styles from '../styles/helloName.module.css';
export async function getServerSideProps() {
  const name = process.env.NAME;
  return { props: { name } };
}

export default function Index({ name }: { name: string }) {
  return <div className ={styles.center}><HelloName name={name} /></div>;
}
